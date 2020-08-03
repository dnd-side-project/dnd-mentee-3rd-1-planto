package com.example.planto

import android.app.Application

class MyApplication: Application() {
    companion object {
        // Prefs
        lateinit var prefs: PreferenceUtil
    }

    override fun onCreate() {
        // Prefs
        prefs = PreferenceUtil((applicationContext))

        super.onCreate()
    }
}