package com.example.planto

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_second_intro.*

class SecondIntroActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second_intro)

        // 이미지 왼쪽으로 15도 회전
        firstImageView.rotation = -15f

        // 다음 버튼 클릭
        buttonSecondIntroConfirm.setOnClickListener {
            // 뷰 전환
            val intent = Intent(this, ThirdIntroActivity::class.java)
            startActivity(intent)
        }
    }
}