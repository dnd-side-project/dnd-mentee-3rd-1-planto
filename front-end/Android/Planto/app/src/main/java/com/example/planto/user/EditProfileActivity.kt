package com.example.planto.user

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.planto.R

class EditProfileActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_edit_profile)
    }

    override fun onResume() {
        super.onResume()

        loadAndShowUserInformation()
    }

    private fun loadAndShowUserInformation() {

    }
}