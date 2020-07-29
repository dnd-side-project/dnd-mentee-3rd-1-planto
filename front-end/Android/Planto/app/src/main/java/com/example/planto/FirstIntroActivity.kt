package com.example.planto

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.SpannableStringBuilder
import androidx.core.text.bold
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val title = SpannableStringBuilder()
            .append("안녕하세요!\n식물과 함께하는\n즐거운 삶,\n")
            .bold { append("Plantö에 오신 것을\n환영합니다!") }

        greetings.text = title
    }
}