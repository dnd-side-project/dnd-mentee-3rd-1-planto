//
//  RegisterPhotoViewController.swift
//  Planto
//
//  Created by 김호준 on 2020/08/08.
//  Copyright © 2020 D&D. All rights reserved.
//

import UIKit
import MobileCoreServices

class RegisterPhotoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    // - MARK: IBOutlets
    @IBOutlet weak var myPlantImage: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!             //사진 저장 변수
    var flagImgSave = false                // 사진 저장 여부
    let width = UIScreen.main.bounds.width  //화면 width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이미지 크기 및 라운드 처리
        myPlantImage.frame = CGRect(x: 0, y: 0, width: width, height: width)
        myPlantImage.layer.cornerRadius = myPlantImage.layer.frame.height / 2
        myPlantImage.layer.masksToBounds = true
        myPlantImage.clipsToBounds = true
    }
    
    // - MARK: IBActions
    @IBAction func bringInAlbum(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            flagImgSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary          //사진 라이브러리에서 가져옴
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false              // 이미지 편집 미허용
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            alert("사진을 등록해주세요!", message: "식물 사진이 필요해요!", actionTitle: "알겠어!")
        }
    }
    
    @IBAction func takePicture(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            flagImgSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera        //카메라로 촬영
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            //카메라 사용 불가 시
            alert("카메라 권한이 필요해요!", message: "\"설정 > 개인 정보 보호 > 카메라\"에서\n카메라 사용 권한을 허용해주세요!", actionTitle: "알겠어!")
        }
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        if myPlantImage.image == nil || myPlantImage.image == UIImage(named: "temp_icon") {
            alert("사진을 등록해주세요",
                  message: "식물을 찾기 위해 사진이 필요해요!",
                  actionTitle: "알겠어!")
        } else {
            //세그웨이 실행
        }
    }
    
    func alert(_ title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 미디어 종류 확인
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        // 미디어 종류 사진
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImgSave {
                // 라이브러리에 사진 저장
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            // 이미지 뷰 출력
            myPlantImage.image = captureImage
        }
        
        self.dismiss(animated: true, completion: nil)   // 이미지 피커 제거
    }
    
    // 촬영, 선택 취소 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)   // 이미지 피커 제거
    }
}
