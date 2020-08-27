package com.example.planto.user.request

import com.example.planto.helper.Constants
import retrofit2.Call
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST

interface JoinService {

    @FormUrlEncoded
    @POST(Constants.USERS)
    fun requestJoin(
        @Field(Constants.EMAIL_STR) email: String,
        @Field(Constants.PASSWORD_STR) password: String,
        @Field(Constants.USERNAME_STR) userName: String
    ): Call<Join>

}
