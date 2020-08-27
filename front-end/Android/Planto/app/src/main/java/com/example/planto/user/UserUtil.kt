package com.example.planto.user

import android.util.Log
import com.example.planto.MyApplication.Companion.prefs

class UserUtil {
    val prefsAuth = "isAuthenticated"
    val prefsAutoLogin = "isAutoLogin"
    val prefsEmail = "email"
    val prefsNickName = "nickName"
    val prefsPassword = "password"
    val prefsToken = "token"
    private val defValue = ""

    private val strFalse = "false"

    private val testUser = mapOf("email" to "test@test.test", "nickName" to "Test", "password" to "1")
    private val adminUser = mapOf("email" to "planto@planto.com", "nickName" to "Plantö", "password" to "1")
    val allUsers = listOf(testUser, adminUser)

    fun isValidEmail(email: String): Boolean {
        return android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()
    }

    fun isExistingEmail(email: String): Boolean {
        var isExisting: Boolean = false
        // To Do: Check Existing User
        for (user in allUsers) {
            if (user[prefsEmail] == email) {
                isExisting = true
            }
        }
        return isExisting
    }

    fun checkUser(email: String, password: String): Boolean {
        var isCorrect: Boolean = false
        // To Do: Find a User by Email on DB
        for (user in allUsers) {
            if (user[prefsEmail] == email && user[prefsPassword] == password) {
                isCorrect = true
            }
        }
        return isCorrect
    }

    fun saveUserPref(key: String, str: String){
        prefs.setString(key, str)
    }

    fun loadUserPref(key: String): String {
        return prefs.getString(key, UserUtil().defValue)
    }

    fun resetAllUserPrefs() {
        prefs.setString(prefsAuth, strFalse)
        prefs.setString(prefsAutoLogin, strFalse)
        prefs.setString(prefsEmail, defValue)
        prefs.setString(prefsNickName, defValue)
        prefs.setString(prefsPassword, defValue)
    }

    fun testSave() {
        val authFlag = prefs.getString(prefsAuth, defValue)
        val autoLogin = prefs.getString(prefsAutoLogin, defValue)
        val email = prefs.getString(prefsEmail, defValue)
        val nickName = prefs.getString(prefsNickName, defValue)
        val password = prefs.getString(prefsPassword, defValue)

        if (authFlag != "" || autoLogin != "" || email != "" || nickName != "" || password != "") {
            Log.i("Test", "\nauthFlag: $authFlag\nautoLogin: $autoLogin\nemail: $email\nnickName: $nickName\npassword: $password")
        }
    }
}