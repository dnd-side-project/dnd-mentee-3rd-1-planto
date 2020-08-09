package com.example.planto.myplant

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_confirm_my_plant.*

class ConfirmMyPlantActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_confirm_my_plant)
        // 품종 클릭
        editTextMyPlantVariety.setOnClickListener {
            val intent = Intent(baseContext, SearchPlantVarietyActivity::class.java)  //todo: 품종 변경 후 컨펌 뷰로 바로 이동되도록 설정
            startActivity(intent)
        }

        // todo: 이름 수정 반영. 이름 수정은 별도의 뷰 이동 없이 처리
        
        // 사진 클릭
        imageConfirmMyPlantPicture.setOnClickListener {
            val intent = Intent(baseContext, GetPlantPictureActivity::class.java)  //todo: 사진 변경 후 컨펌 뷰로 바로 이동되도록 설정
            startActivity(intent)
        }

        // 등록
        buttonGetMyPlantConfirm.setOnClickListener {
            // ToDo: 메인 뷰 이동 및 식물 등록
        }
        // 취소 버튼 클릭
        buttonGetMyPlantCancel.setOnClickListener {
            val intent = Intent(baseContext, SetPlantNameActivity::class.java)  //todo: 메인화면으로 이동
            startActivity(intent)
        }
    }
}