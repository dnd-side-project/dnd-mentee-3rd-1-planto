package com.example.planto

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_first_intro.*

class FirstIntroActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_first_intro)

        // 다음 버튼 클릭
        buttonFirstIntroConfirm.setOnClickListener {
            // 뷰 전환
            val intent = Intent(this, SecondIntroActivity::class.java)
            startActivity(intent)
        }
    }
}