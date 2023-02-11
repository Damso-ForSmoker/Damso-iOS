//
//  ReportInputVC.swift
//  Damso
//
//  Created by 문정호 on 2023/01/26.
//

import UIKit

class ReportInputVC: BaseVC {
    
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
    
    override func loadView(){
        view = reportinputView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
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
    
    override func setNavigationBar() {
        self.navigationItem.title = "흡연구역 제보하기"
    }
    
    
    
    //MARK: - Helper
    func updateLabel(location: String?){
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
    
    @objc func tappedReportButton(_ sender: UIButton){
        if reportinputView.nameTextField.text?.isEmpty ?? true || reportinputView.supervisorTextField.text?.isEmpty ?? true || !btncheck {//텍스트 필드에 값이 없을때 와 시설 형태가 클릭된게 없을 때
            print("불가능")
        } else{
            let data = ReportInputModel(location: reportinputView.locationLabel.text!, title: reportinputView.nameTextField.text!, type: 2, installAgency: reportinputView.supervisorTextField.text!)
            print(data)
            ReportInputManager.reportInputManager.uploadNewArea(model: data, completion: { resultString in
                print(resultString)
            })
        }
    }
    
    @objc func tappedUploadButton(_ sender: UIButton){
        self.present(imgPicker, animated: true, completion: nil) //imagepickerview 화면을 띄우는 코드
    }
}

extension ReportInputVC: UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //키보드 return 눌렀을때 키보드 사라지는 메소드
        self.reportinputView.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { //이미지피커뷰에서 이미지 선택했을때 메소드
        var newImage: UIImage? = nil
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            newImage = possibleImage
        }
        reportinputView.imgView.image = newImage //imgView를 input 이미지로 변경
        picker.dismiss(animated: true) //피커 뷰 사라지는 메소드
    }
}
