package com.example.planto

import android.content.DialogInterface
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import kotlinx.android.synthetic.main.activity_third_intro.*

class ThirdIntroActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_third_intro)

        // 다음 버튼 클릭
        buttonThirdIntroConfirm.setOnClickListener {
            // To Do: next view(takePicture) 이동
        }

        // 지금은 별로 버튼 클릭
        buttonThirdIntroCancel.setOnClickListener {
            // popup alert 생성 후 출력
            val alertBuilder = AlertDialog.Builder(this)
            alertBuilder.setTitle("아직 준비가 안 되셨나봐요")
            alertBuilder.setMessage("준비가 되면 다시 찾아주세요!")
            alertBuilder.setPositiveButton("알겠어!", DialogInterface.OnClickListener { _, _ ->
                return@OnClickListener
            })

            alertBuilder.show()
        }
    }
}
