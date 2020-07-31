package com.example.planto

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class JoinActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_join)

        val actionBar = supportActionBar
        actionBar!!.title = "회원 가입"
    }
}