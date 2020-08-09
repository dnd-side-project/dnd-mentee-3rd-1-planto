package com.example.planto.myplant

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_search_plant_variety.*

class SearchPlantVarietyActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_search_plant_variety)
        // 이미지 왼쪽으로 15도 회전
        searchPlantVarietyImageView.rotation = -15f

        // 이미지 스케일 조절
        searchPlantVarietyImageView.scaleX = 0.95f
        searchPlantVarietyImageView.scaleY = 0.95f

        // 검색 버튼 클릭
        buttonSearchPlantVarietyConfirm.setOnClickListener {
            // ToDo: DB로부터 식물 품종 데이터 검색하여 식물 품종명이 있으면 해당 품종이름을, 없으면 커스텀 품종이름을 지정하도록 할것
            val intent = Intent(baseContext, ConfirmPlantVarietyActivity::class.java)
            startActivity(intent)
        }

        // 취소 버튼 클릭
        buttonSearchPlantVarietyCancel.setOnClickListener {
            //todo: 메인화면으로 이동
        }
    }
}