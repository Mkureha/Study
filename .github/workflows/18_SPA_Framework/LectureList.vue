<template>
  <div class="list">

    <!-- data 내 pageTitle의 값이 아래 h2에 들어갑니다. -->
    <h2>{{pageTitle}}</h2>
    <table class="lectures">

      <!-- data 내 lectueList 배열의 요소 하나하나가 아래 tr로 만들어집니다.   -->
      <!-- 각 요소 하나하나를 lecture로, 그 번호를 lecIdx로(여기서는 사용되지 않음) 부릅니다. -->
      <tr v-for="(lecture, lecIdx) in lectureList" :key="lecIdx"
        @click="toDetail(lecture.idx)">
        <td class="thumbnail">
            <img v-bind:src="lecture.lec_thumb"/>
        </td>
        <td class="title">
            <span> 
                {{lecture.lec_date}}
            </span>
            <br>
            {{lecture.lec_title}}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: 'lecture-list',
  // 데이터가 들어가는 곳입니다.
  data: function() {
    return {
      pageTitle: '두꺼운 코딩사전 강좌 리스트',
      lectureList: []
    }
  },
  // 함수들을 지정하는 곳입니다.
  methods: {
    toDetail: function (idx) {
      this.$router.push(`detail/${idx}`)
    }
  },
  // 페이지가 열리면 실행되는 명령어입니다.
  mounted () {
    let _this = this
    // 아래의 임시 주소에서 정보를 받아옵니다.
    _this.$axios.get('http://127.0.0.1:8000/api/lectures')
    .then((response) => {
      response.data.map((item) => {
        // 받아온 정보를 lectureList에 넣어줍니다.
        _this.lectureList.push(item)
      })
    })
  }
}
</script>

<style lang="scss" scoped>
  @import '../assets/scss/lecture.scss'
</style>
