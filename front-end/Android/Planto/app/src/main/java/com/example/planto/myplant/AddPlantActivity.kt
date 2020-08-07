package com.example.planto.myplant

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_add_plant.*

class AddPlantActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_plant)

        // 검색 버튼 클릭
        buttonGetPlantNameConfirm.setOnClickListener {
            // ToDo: DB에 식물품종 및 식물이름 저장 - 유저와 relation
            val intent = Intent(baseContext, ConfirmPlantVarietyActivity::class.java)
            startActivity(intent)
        }
        // 취소 버튼 클릭
        buttonGetPlantNameCancel.setOnClickListener {
            // ToDo: DB에 식물품종 및 식물이름 저장 - 유저와 relation
            // (이름 미지정 -> 식물 품종명이 이름으로 대체되어 저장)
            val intent = Intent(baseContext, ConfirmPlantVarietyActivity::class.java)
            startActivity(intent)
        }
    }
}