package com.example.planto.user.request

import com.example.planto.helper.Constants
import retrofit2.Call
import retrofit2.http.*

interface JoinService {

    @FormUrlEncoded
    @POST(Constants.USERS)
    fun requestJoin(
        @Field(Constants.EMAIL_STR) email: String,
        @Field(Constants.PASSWORD_STR) password: String,
        @Field(Constants.USERNAME_STR) userName: String
    ): Call<Join>

}
