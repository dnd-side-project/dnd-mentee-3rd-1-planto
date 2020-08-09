//
//  RegisterPhotoViewController.swift
//  Planto
//
//  Created by 김호준 on 2020/08/09.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit

class RegisterPhotoViewController: UIViewController {

    @IBOutlet weak var myPlantImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // - MARK: IBActions
    @IBAction func selectFromLibrary(_ sender: UIButton) {
        //이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true     // 사진 편집 가능
        
        //델리게이트 지정
        picker.delegate = self
        
        self.present(picker, animated: false, completion: nil)
    }
    
    @IBAction func takePicture(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        
        picker.delegate = self
        
        self.present(picker, animated: false, completion: nil)
    }
    
    @IBAction func done(_ sender: UIButton) {
    }
}

// - MARK: UINavigationControllerDelegate
extension RegisterPhotoViewController: UINavigationControllerDelegate {
}

// - MARK: UIImagePickerControllerDelegate
extension RegisterPhotoViewController: UIImagePickerControllerDelegate {
    // 이미지 피커에서 이미지를 선택하지 않았을 때
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //피커 창 닫기
        picker.dismiss(animated: false, completion: nil)
        
        let alert = UIAlertController(title: "", message: "이미지 선택을 취소하셨습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    // 이미지 피커에서 이미지를 선택했을 때
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //피커 창 닫기
        picker.dismiss(animated: false) {
            //이미지를 이미지 뷰에 표시
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.myPlantImageView.image = img
        }
    }
}
