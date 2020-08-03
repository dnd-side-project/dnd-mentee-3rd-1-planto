package com.example.planto

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.planto.user.LogInActivity
import java.lang.Exception

class SplashScreenActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splashscreen)

        // 2초 지연 후 뷰 전환
        val background = object : Thread() {
            override fun run() {
                try{
                    Thread.sleep(2000)

                    val intent = Intent(baseContext, LogInActivity::class.java)
                    startActivity(intent)
                }
                catch (e: Exception) {
                    e.printStackTrace()
                }
            }
        }

        background.start()
    }
}