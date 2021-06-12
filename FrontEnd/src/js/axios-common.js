import axios from "axios";

//사용자 정의 axios 인스턴스에 대한 기본 설정
// axios 인스턴스를 만들 때 구성 기본 값 설정
//const instance = axios.create(); 후에 기본값 설정
//axios.defaults.baseURL = 'https://api.example.com';

export default axios.create({
	baseURL: "http://localhost",
	headers: {
		"Content-type": "application/json",
	},
});
