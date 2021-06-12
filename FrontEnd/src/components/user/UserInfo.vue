<template>
    <b-container id="UserInfoForm" class="my-5 py-5">
        <b-row>
            <b-col cols="2"><!-- 그리드 영역을 맞추기 위한 빈 태그--></b-col>
            <b-col>
                <div>
                    <b-jumbotron id="">
                        <template #header>회원정보수정</template>
                        <template #lead>
                            MONEY<b-icon class="mx-1" scale="1" variant="danger" icon="suit-heart-fill"></b-icon>HOUSE
                        </template>
                        <hr class="my-4">
                        <p>
                            회원 정보를 수정합니다🎈
                        </p>
                    </b-jumbotron>
                </div>
            </b-col>
            <b-col cols="2"><!-- 그리드 영역을 맞추기 위한 빈 태그--></b-col>
        </b-row>
        <b-row class="mt-5">
            <b-col cols="3"><!-- 그리드 영역을 맞추기 위한 빈 태그--></b-col>
            <b-col cols="6">
                <b-form @submit="update">
                    <b-container>
                        <div class="my-4">
                            <h4>기본 정보</h4>
                            <p>✔ ID는 수정할 수 없습니다</p>
                        </div>
                        <!-- ID -->
                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>ID</label>
                            </b-col>
                            <b-col cols="9">
                                <span id="user_id">{{storeUser.user_id}}</span>
                            </b-col>
                        </b-row>
                        <b-row class="mt-2">
                            <b-col cols="3"></b-col>
                            <b-col cols="9" class="descript"><span v-text="d_id"></span></b-col>
                        </b-row>
                        <!-- NAME -->
                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>Name</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    type="text"
                                    id="user_name"
                                    v-model="storeUser.user_name"
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
                        <!-- EMAIL -->
                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>Email</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    id="user_email"
                                    type="email"
                                    v-model="storeUser.user_email"
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
                            <h4>선택정보</h4>
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
                                    v-model.lazy="storeUser.user_phone"
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

                        <b-row class="mt-3">
                            <b-col cols="3" align-self="center">
                                <label>PW</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    id="user_pw"
                                    type="password"
                                    v-model.lazy="user_pw"
                                    placeholder="비밀번호를 입력해주세요"
                                    required
                                ></b-form-input>
                            </b-col>
                        </b-row>
                        <b-row>
                            <p class="text-center my-3">회원정보를 수정하시려면 비밀번호를 입력해주세요!</p>
                            <b-button variant="primary" class="m-2" type="submit">수정하기</b-button>
                        </b-row>
                    </b-container>
                </b-form>
            </b-col>
            <b-col cols="3"><!-- 그리드 영역을 맞추기 위한 빈 태그--></b-col>
        </b-row>
    </b-container>
</template>

<script src="./UserInfo"></script>

<style scope>
.jumbotron > h1 {
    font-family: 'Franklin Gothic Medium';
}
.descript > span {
    font-size: 0.8em;
}
</style>