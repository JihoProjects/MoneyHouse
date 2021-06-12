<template>
    <b-container id="UserJoinForm" class="my-5 py-5">
        <b-row>
            <b-col cols="2"></b-col>
            <b-col>
                <div>
                    <b-jumbotron id="">
                        <template #header>회원가입</template>
                        <template #lead>
                            MONEY<b-icon class="mx-1" scale="1" variant="danger" icon="suit-heart-fill"></b-icon>HOUSE에
                            가입해주셔서 감사합니다.
                        </template>
                        <hr class="my-4">
                        <p>
                            좋은 서비스 제공을 위해 필요한 정보를 제공해주세요😊
                        </p>
                    </b-jumbotron>
                </div>
            </b-col>
            <b-col cols="2"></b-col>
        </b-row>
        <b-row class="mt-5">
            <b-col cols="3">
                <!-- 그리드 영역을 맞추기 위한 빈 태그-->
            </b-col>
            <b-col cols="6">
                <b-form @submit="join">
                    <b-container>
                        <div class="my-4">
                            <h4>필수입력</h4>
                            <p>✔ 회원가입에 필요한 필수 정보를 입력해주세요.</p>
                        </div>
                        <!-- NAME -->
                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>Name</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    type="text"
                                    v-model.lazy="user_name"
                                    placeholder="이름을 입력해주세요"
                                    @blur="nameVaild"
                                    required
                                ></b-form-input>
                            </b-col>
                        </b-row>
                        <b-row class="mt-2">
                            <b-col cols="3"></b-col>
                            <b-col cols="9" class="descript"><span v-text="d_name"></span></b-col>
                        </b-row>
                        <!-- ID -->
                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>ID</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    id="user_id"
                                    type="text"
                                    v-model.lazy="user_id"
                                    @blur="identificationVaild"
                                    placeholder="아이디를 입력해주세요"
                                    required
                                ></b-form-input>
                            </b-col>
                        </b-row>
                        <b-row class="mt-2">
                            <b-col cols="3"></b-col>
                            <b-col cols="9" class="descript"><span v-text="d_id"></span></b-col>
                        </b-row>
                        <!-- PASSWORD -->
                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>PW</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    id="user_pw"
                                    type="password"
                                    v-model.lazy="user_pw"
                                    @blur="passwordVaild"
                                    placeholder="비밀번호를 입력해주세요"
                                    required
                                ></b-form-input>
                            </b-col>
                        </b-row>
                        <b-row class="mt-2">
                            <b-col cols="3"></b-col>
                            <b-col cols="9" class="descript"><span v-text="d_pw"></span></b-col>
                        </b-row>
                        <!-- PASSWORD CHECK -->
                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>PW Check</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    id="user_pw_ck"
                                    type="password"
                                    v-model.lazy="user_pw_ck"
                                    @blur="passwordCheck"
                                    placeholder="다시 한 번 비밀번호를 입력해주세요"
                                    required
                                ></b-form-input>
                            </b-col>
                        </b-row>
                        <b-row class="mt-2">
                            <b-col cols="3"></b-col>
                            <b-col cols="9" class="descript"><span v-text="d_pw_ck"></span></b-col>
                        </b-row>
                        <!-- EMAIL -->
                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>Email</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    id="user_email"
                                    type="email"
                                    v-model="user_email"
                                    @blur="emailValid"
                                    placeholder="이메일을 입력해주세요"
                                    required
                                ></b-form-input>
                            </b-col>
                        </b-row>
                        <b-row class="mt-2">
                            <b-col cols="3"></b-col>
                            <b-col cols="9" class="descript"><span v-text="d_email"></span></b-col>
                        </b-row>

<!---------------------><hr class="my-5"><!--------------------->

                        <div class="my-4">
                            <h4>선택입력</h4>
                            <p>✨ 원활한 서비스를 제공하기 위해 선택 정보를 입력해주세요.</p>
                        </div>
                        <!-- PHONE -->
                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>PHONE</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    id="user_phone"
                                    type="text"
                                    v-model.lazy="user_phone"
                                    @blur="phoneVaild"
                                    placeholder="010-0000-0000"
                                ></b-form-input>
                            </b-col>
                        </b-row>
                        <b-row class="mt-2">
                            <b-col cols="3"></b-col>
                            <b-col cols="9" class="descript"><span v-text="d_phone"></span></b-col>
                        </b-row>
                        <!-- ADDRESS -->
                        <DaumAddrAPI />

<!---------------------><hr class="my-5"><!--------------------->

                        <b-row>
                            <p class="text-center">😊 가입해주셔서 감사합니다! 잘 입력하셨나요? 🙄</p>
                            <b-button variant="primary" class="m-2" type="submit">JOIN</b-button>
                        </b-row>
                    </b-container>
                </b-form>
            </b-col>
            <b-col cols="3">
                <!-- 그리드 영역을 맞추기 위한 빈 태그-->
            </b-col>
        </b-row>
    </b-container>
</template>

<script src="./UserJoin"></script>

<style scope>
.jumbotron > h1 {
    font-family: 'Franklin Gothic Medium';
}
.descript > span {
    font-size: 0.8em;
}
</style>
