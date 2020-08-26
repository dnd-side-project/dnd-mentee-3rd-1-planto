package com.example.planto.myplant

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_confirm_plant_variety.*

class ConfirmPlantVarietyActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_confirm_plant_variety)

        // 이미지 스케일 조절
        confirmPlantVarietyImageView.scaleX = 0.95f
        confirmPlantVarietyImageView.scaleY = 0.95f

        // 확인 버튼 클릭
        buttonConfirmPlantVarietyConfirm.setOnClickListener {
            val intent = Intent(baseContext, SetPlantNameActivity::class.java)
            startActivity(intent)
        }

        // 취소 버튼 클릭
        buttonConfirmPlantVarietyCancel.setOnClickListener {
            val intent = Intent(baseContext, SearchPlantVarietyActivity::class.java)
            startActivity(intent)
        }
    }
}