//
//  ReportInputVC.swift
//  Damso
//
//  Created by 문정호 on 2023/01/26.
//

import UIKit

class ReportInputVC: BaseVC {
    //MARK: - Properties
    let reportinputView = ReportInputView()
    var locationString: String?{
        didSet{
            updateLabel(location: locationString)
        }
    }
    lazy var btnArray = [reportinputView.exactlyOpenButton,reportinputView.OpenButton, reportinputView.closedButton, reportinputView.exactolyClosedButton]
    
    let imgPicker = UIImagePickerController().then{
        $0.sourceType = .photoLibrary //image를 앨범에서 선택하는 코드
    }
    var btncheck : Bool = false
    lazy var la: Double = 0
    lazy var lo: Double = 0
    lazy var newImage: UIImage? = nil
    //MARK: - loadView
    override func loadView(){
        view = reportinputView
    }
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - configure
    override func configure() {
        self.reportinputView.nameTextField.delegate = self
        self.reportinputView.supervisorTextField.delegate = self
        self.imgPicker.delegate = self //이미지 피커 컨트롤러 딜리게이트 설정
        self.reportinputView.exactlyOpenButton.addTarget(self, action: #selector(tappedclassificationButton(_:)), for: .touchUpInside)
        self.reportinputView.OpenButton.addTarget(self, action: #selector(tappedclassificationButton(_:)), for: .touchUpInside)
        self.reportinputView.closedButton.addTarget(self, action: #selector(tappedclassificationButton(_:)), for: .touchUpInside)
        self.reportinputView.exactolyClosedButton.addTarget(self, action: #selector(tappedclassificationButton(_:)), for: .touchUpInside)
        self.reportinputView.reportButton.addTarget(self, action: #selector(tappedReportButton(_:)), for: .touchUpInside)
        
        self.reportinputView.uploadButton.addTarget(self, action: #selector(tappedUploadButton(_:)), for: .touchUpInside)
    }
    //MARK: - setNavigationBar
    override func setNavigationBar() {
        self.navigationItem.title = "흡연구역 제보하기"
    }
    
    
    
    //MARK: - Helper
    func updateLabel(location: String?){ //
        guard let location = location else {return} //넘어온 값이 있다면 값을 없다면 없는 값 리턴
        reportinputView.locationLabel.text = location //위에서 할당한 값을 라벨로 할당
    }
    
    @objc func tappedclassificationButton(_ sender: UIButton){ //버튼 하나만 설정하게 하는 메소드
        for btn in btnArray{
            if sender == btn{
                if btn.isSelected{
                    btn.isSelected = false
                    btncheck = false
                } else{
                    btn.isSelected = true
                    btncheck = true
                }
            } else {
                btn.isSelected = false
            }
        }
    }
    
    @objc func tappedReportButton(_ sender: UIButton){ //제보하기 버튼을 눌렀을 때 실행되는 함수
        //필수로 필요한 데이터인 텍스트 필드 값이 없을 때와 시설 형태 체크가 되어있지 않을때를 체크
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        if reportinputView.nameTextField.text?.isEmpty ?? true || reportinputView.supervisorTextField.text?.isEmpty ?? true || !btncheck {//텍스트 필드에 값이 없을때 와 시설 형태가 클릭된게 없을 때
            print("불가능")
            let rejectAlert = UIAlertController(title: "필수 정보 입력", message: "필수적으로 입력되어야 하는 데이터가 입력되지 않았습니다.", preferredStyle: .alert)
            rejectAlert.addAction(okAction)
            present(rejectAlert, animated: false, completion: nil)
        } else{ //필요한 데이터가 모두 입력되었을때
            let typeNum = checkType() //사용자가 체크한 타입을 확인
            
            print(newImage?.pngData()!)
            
            let data = ReportInputModel(location: reportinputView.locationLabel.text!, title: reportinputView.nameTextField.text!, type: typeNum, installAgency: reportinputView.supervisorTextField.text!,img: newImage?.pngData() ,la: self.la, lo: self.lo) //서버로 넘길 데이터를 생성
            
            print(data)
            
            //서버 통신
            ReportInputManager.reportInputManager.uploadNewArea(model: data, completion: { result in
                print(result)
                if result{ //서버 데이터 전달에 성공했다면
                    let successAlert = UIAlertController(title: "제보 완료", message: "정상적으로 제보되었습니다.", preferredStyle: .alert)
                    successAlert.addAction(okAction)
                    self.present(successAlert, animated: false, completion: nil)
                    self.navigationController?.popViewController(animated: true) //제보를 성공적으로 마쳤으면 제보하기 화면으로 되돌아갑니다.
                } else{
                    let failAlert = UIAlertController(title: "제보 실패", message: "제보에 실패하였습니다.", preferredStyle: .alert)
                    
                    failAlert.addAction(okAction)
                    
                    self.present(failAlert, animated: false, completion: nil)
                }
            })
        }
    }
    
    @objc func tappedUploadButton(_ sender: UIButton){
        self.present(imgPicker, animated: true, completion: nil) //imagepickerview 화면을 띄우는 코드
    }
    
    func checkType() -> Int{
        for btn in btnArray { //시설형태를 확인하는 함수
            if btn.isSelected{
                if btn == reportinputView.exactlyOpenButton{ return 1 }
                if btn == reportinputView.OpenButton{ return 2 }
                if btn == reportinputView.closedButton{ return 3 }
                if btn == reportinputView.exactolyClosedButton{ return 4 }
            }
        }
        return 3 //오류로 인한 타입체크 불가시 default로 3을 넘김
    }
}

extension ReportInputVC: UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //키보드 return 눌렀을때 키보드 사라지는 메소드
        self.reportinputView.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { //이미지피커뷰에서 이미지 선택했을때 메소드
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            newImage = possibleImage
            
        }
        reportinputView.imgView.image = newImage
        reportinputView.imgView.image = newImage //imgView를 input 이미지로 변경
        picker.dismiss(animated: true) //피커 뷰 사라지는 메소드
    }
    
    func imagePickerControllerDidCancel(_ pcker: UIImagePickerController){
        reportinputView.imgView.image = nil
        dismiss(animated: true)
    }
}
