package com.example.planto.myplant

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.planto.R
import kotlinx.android.synthetic.main.activity_get_plant_picture.*


class GetPlantPictureActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_get_plant_picture)
        // 카메라 버튼 클릭
        buttonGetPlantPictureFromCamera.setOnClickListener {
            // ToDo: 카메라에서 사진 가져오기
            val intent = Intent(baseContext, ConfirmMyPlantActivity::class.java)
            startActivity(intent)
        }

        // 앨범 버튼 클릭
        buttonGetPlantPictureFromAlbum.setOnClickListener {
            // ToDo: 앨범에서 사진 가져오기
            val intent = Intent(baseContext, ConfirmMyPlantActivity::class.java)
            startActivity(intent)
        }

        // 취소 버튼 클릭
        buttonGetPlantPictureCancel.setOnClickListener {
            val intent = Intent(baseContext, SetPlantNameActivity::class.java)
            startActivity(intent)
        }

    }
}