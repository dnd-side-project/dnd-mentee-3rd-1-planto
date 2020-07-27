//
//  TakePictureViewController.swift
//  Planto
//
//  Created by Planto on 7/26/20.
//  Copyright © 2020 Planto. All rights reserved.
//

import UIKit
import MobileCoreServices

class TakePictureViewController: UIViewController {
    
    // - MARK: IBOutlets
    @IBOutlet weak var imgView: UIImageView!    // 이미지 뷰
    
    // UIImagePickerController 인스턴스
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!  // 사진 저장 변수
    var flagImageSave = false   // 사진 저장 여부
    
    let width = UIScreen.main.bounds.width  // 화면 width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // placeholder image
        imgView.image = UIImage(named: "temp_icon")
        
        // 이미지 크기 및 라운드 처리
        imgView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        imgView.layer.cornerRadius = imgView.layer.frame.height / 2
        imgView.layer.masksToBounds = true
        imgView.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // FindPlnat 세그웨이 실행 준비
        if segue.identifier == "FindPlant" {
            guard let nextVc = segue.destination as? FindPlantViewController else {
                return
            }
            nextVc.image = captureImage
        }
    }
    
    
    // - MARK: IBActions
    // 사진 촬영
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true    // 저장 플래그
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera    // 카메라
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false   // 편집 미허용
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            // 카메라 사용 불가
            alert("카메라 권한이 필요해요",
                  message: "\"설정 > 개인 정보 보호 > 카메라\"에서\n카메라 사용 권한을 허용해주세요!",
                  actionTitle: "알겠어!")
        }
    }
    
    // 사진 불러오기
    @IBAction func btnCaptureImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary  // 라이브러리
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false   // 편집 미허용
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            alert("사진 권한이 필요해요",
                  message: "\"설정 > 개인 정보 보호 > 사진\"에서\n사진 접근 권한을 허용해주세요!",
                  actionTitle: "알겠어!")
        }
    }
    
    // 완료 버튼 클릭
    @IBAction func btnFindPlant(_ sender: UIButton) {
        if (imgView.image == nil || imgView.image == UIImage(named: "temp_icon")) { // 선택된 사진이 없음
            alert("사진을 등록해주세요",
                  message: "식물을 찾기 위해 사진이 필요해요!",
                  actionTitle: "알겠어!")
        } else {
            // FindPlant 세그웨이 실행
            performSegue(withIdentifier: Constants.SegueName.findPlant, sender: btnFindPlant)
        }
    }
    
    func alert(_ title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

// - MARK: UINavigationControllerDelegate
extension TakePictureViewController: UINavigationControllerDelegate {
    
}

// - MARK: UIImagePickerControllerDelegate
extension TakePictureViewController: UIImagePickerControllerDelegate {
    // 촬영이나 선택 후 호출되는 델리게이트 메서드
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 미디어 종류 확인
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        // 미디어 종류 사진
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave {
                // 라이브러리에 사진 저장
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage    // 이미지 뷰 출력
        }
        
        self.dismiss(animated: true, completion: nil)   // 이미지 피커 제거
    }
    
    // 촬영, 선택 취소 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)   // 이미지 피커 제거
    }
}
