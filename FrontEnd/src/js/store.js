import Vue from "vue";
import Vuex from "vuex";

import axios from "./axios-common.js";

import userStore from '@/js/modules/userStore.js'

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    userStore,
  },
  state: {
    //----start -------Deal.vue에서 사용하는 데이터들의 저장된 곳
    gus: [],
    dongs: [],
    houseDeal: [],
    baseAddress: "",
    makers: [],
  //--------end ------------ Deal.vue  -------------------------
  //--------start ---------- Board.Vue --------------
  boardlist: [],
  board: null,
  comments: [],
  subcomments:[]
  ////--------End ---------- Board.Vue--------------
  },
  getters: {
    boardlist(state) {
      return state.boardlist;
    },
    board(state) {
      return state.board;
    }
  },
  actions: {
    //----start -------Deal.vue에서 사용하는 액션
    cityChange: (store,payload) => {
      console.log(payload);
      axios.get("/citySearch/" + payload.city)
      .then((response) => {
        console.log("시 조회 하였습니다. ");
        store.commit("CITY_SEARCH", { gus: response.data });
      })
        .catch((exp) => alert("조회 처리에 실패 했습니다." + exp))
      
    },

    guChange: (store,payload) => {
      console.log(payload);
      axios.get("/gugunSearch/" + payload.gu)
      .then((response) => {
        console.log("구 조회 하였습니다.");
        store.commit("GU_SEARCH", { dongs: response.data });
      })
        .catch((exp) => alert("조회 처리에 실패 했습니다." + exp))
      
    },
    dongChange: (store,payload) => {
      console.log(payload);
      axios.get("/dongSearch/" + payload.dong)
      .then((response) => {
        console.log("매물 조회 하였습니다.");
        store.commit("DONG_SEARCH", { houseDeal: response.data });
      
      })
        .catch((exp) => alert("조회 처리에 실패 했습니다." + exp))
      
    },
    locationDongSearch: (store, payload) => {
      axios.get("/locationDongSearch/" + payload.dong)
        .then((response) => {
          console.log("좌표 조회 하였습니다.");
          store.commit("LOCATION_DONG_SEARCH", { baseAddress: response.data });
        })
        .catch((exp) => alert("좌표 조회 처리에 실패 했습니다." + exp))
    
    },
    locationAptSearch: (store, payload) => {
      axios.get("/locationAptSearch/" + payload.dong)
      .then((response) => {
        console.log("마커를 조회 하였습니다.");
        store.commit("LOCATION_APT_SEARCH", { makers: response.data });
      })
      .catch((exp) => alert("마커 조회 처리에 실패 했습니다." + exp))
    },
    nameSearch: (store, payload) => {
      console.log(payload.name);
      axios.get("/nameSearch/"+payload.name)
      .then((response) => {
        console.log("이름으로 조회 하였습니다.");
        store.commit("NAME_SEARCH", { houseDeal: response.data });
        
      })
      .catch((exp) => alert("아파트 조회 처리에 실패 했습니다." + exp))
    },
    houseSearch: (store) => {
      axios.get("/houseSearch")
        .then((response) => {
          console.log("아파트를 조회했습니다.");
          store.commit("HOUSE_SERACH",{makers:response.data})
        })
      
    },
    //----end ---------------Deal.vue----------------
    //--------start ---------- Board.Vue--------------
      selectAll: (store) => {
        axios.get("/qna")
          .then((response) => {
            store.commit("SELECT_ALL", { boardlist: response.data })
            
          })
          .catch((response)=> {console.log(response);})
      },
  
      selectOne: (store,payload) => {
        console.log(payload);
        return axios.get("/qna/" + payload.id)
        .then((response) => {
          console.log("조회 하였습니다.");
          store.commit("SELECT_ONE", { board: response.data });
        })
          .catch((exp) => alert("조회 처리에 실패 했습니다." + exp))
        
      },
      addBoard: (store, payload) => {
        axios
          .post("/qna/", payload )
          .then(() => {
            console.log("추가 처리하였습니다.");
            store.dispatch("selectAll"); //call action
            console.log(payload);
          })
          .catch((exp) => {
            alert("추가 처리에 실패하였습니다." + exp)
            console.log(payload);
        
          });
      },
      boardRemove: (store, payload) => {
        axios
          .delete("/qna/" + payload)
          .then(() => {
            console.log("삭제 성공!");
            store.dispatch("selectAll");
          })
          .catch((exp) => {
            console.log("삭제하지 못했습니다" + exp);
          });
      },
      boardUpdate: (store, payload) => {
        axios
          .put("/qna" , payload)
          .then(() => {
            console.log("수정 처리하였습니다.");
            store.dispatch("selectAll"); //call action
          })
          .catch((exp) => alert("수정 처리에 실패하였습니다." + exp));
    },
    selectComment: (store,payload) => {
      console.log(payload);
      axios.get("/comment/" + payload.id)
      .then((response) => {
        console.log("댓글 조회 하였습니다.");
        console.log(response.data);
        store.commit("SELECT_COMMENT", { comments: response.data });
      })
        .catch((exp) => alert("조회 처리에 실패 했습니다." + exp))
      
    },
    addComment: (store, payload) => {
      console.log(payload);
      axios
        .post("/comment", payload )
        .then(() => {
          console.log("댓글 추가 처리하였습니다.");
          store.dispatch("selectComment", { id:payload.qid }); //call action
          console.log(payload);
        })
        .catch((exp) => {
          alert("추가 처리에 실패하였습니다." + exp)
          console.log(payload);
      
        });
    },
    deleteComment:(store, payload) => {
      axios
        .delete("/comment/" + payload.cid)
        .then(() => {
          console.log("삭제 성공!");
          store.dispatch("selectComment" ,{qid:payload.qid});
        })
        .catch((exp) => {
          console.log("삭제하지 못했습니다" + exp);
        });
    },

    selectSubComment: (store,payload) => {
      console.log("selectSubComment "+payload.qid);
      axios.get("/subcomment/" + payload.qid+"/"+payload.cid)
      .then((response) => {
        console.log("대댓글 조회 하였습니다.");
        //console.log(response.data);
        store.commit("SELECT_SUB_COMMENT", { subcomments: response.data });
      })
        .catch((exp) => alert("조회 처리에 실패 했습니다." + exp))
      
    },
    addSubComment: (store, payload) => {
      console.log(payload);
      axios
        .post("/subcomment", payload )
        .then(() => {
          console.log("대댓글 추가 처리하였습니다.");
          store.dispatch("selectSubComment", { qid:payload.qid ,cid:payload.cid }); //call action
          console.log(payload);
        })
        .catch((exp) => {
          alert("추가 처리에 실패하였습니다." + exp)
          console.log(payload);
      
        });
    },
    deleteSubComment: (store, payload) => {
      console.log(payload);
      axios
        .delete("/subcomment/" + payload.sid)
        .then(() => {
          console.log("삭제 성공!");
          store.dispatch("selectSubComment", {qid: payload.qid, cid: payload.cid});
        })
        .catch((exp) => {
          console.log("삭제하지 못했습니다" + exp);
        });
    },
  ////--------End ---------- Board.Vue--------------
  
  },
  mutations: {
    //----start -------Deal.vue에서 실질적인 데이터를 저장하는 mutation
    CITY_SEARCH: (state,payload) => {
      state.gus = payload.gus;
    },
    GU_SEARCH: (state,payload) => {
      state.dongs = payload.dongs;
    },
    DONG_SEARCH: (state,payload) => {
      state.houseDeal = payload.houseDeal;
    },
    LOCATION_DONG_SEARCH: (state, payload) => {
      state.baseAddress = payload.baseAddress;
    },
    LOCATION_APT_SEARCH: (state, payload) => {
      state.makers = payload.makers;
    },
    NAME_SEARCH: (state, payload) => {
      console.log(payload.houseDeal);
      state.houseDeal = payload.houseDeal;
    },
    HOUSE_SERACH: (state, payload) => {
      state.makers = payload.makers
    },
     //----end ---------------Deal.vue-------------
    //----start -------board.vue에서 실질적인 데이터를 저장하는 mutation
    SELECT_ALL: (state, payload) =>{
      state.boardlist = payload.boardlist;
    },
    SELECT_ONE: (state, payload) => {
      state.board = payload.board;
    },
    SELECT_COMMENT: (state, payload) => {
      state.comments = payload.comments;
    },
    SELECT_SUB_COMMENT: (state, payload) => {
      state.subcomments = payload.subcomments;
    },
    //----end -------board.vue에서 실질적인 데이터를 저장하는 mutation
  }
});
