<template>

  <!-- data 내 lecture에 값이 들어와야(null이 아니도록) 아래 요소가 나타납니다. -->
  <div v-if="lecture !== null" class="detail">
    <h3>
      {{lecture.lec_title}}
    </h3>
    <table class="lecture">
      <tr>
        <td>
          <span>영상번호:</span>
          {{lecture.idx}}
        </td>
        <td>
          <span>카테고리:</span>
          {{lecture.lec_category}}
        </td>
        <td>
          <span>영상길이:</span>
          {{lecture.lec_length}}
        </td>
      </tr>
      <tr>
        <td colspan="3" class="lec-pic">
          <iframe width="560" height="315" 
            v-bind:src="'https://www.youtube.com/embed/' + lecture.lec_code" 
            frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
            allowfullscreen></iframe>
        </td>
      </tr>
    </table>
    <div class="commentCount">
      <span>
        댓글: {{commentList.length}}
      </span>
    </div>
    <table class="comments">

      <!-- data 내 commentList 배열의 요소 하나하나가 아래 tr로 만들어집니다.   -->
      <!-- 각 요소 하나하나를 comment로, 그 번호를 cmtIdx로(여기서는 사용되지 않음) 부릅니다. -->
      <tr v-for="(comment, cmtIdx) in commentList" :key="cmtIdx">
        <td>
          {{comment.lc_name}}
        </td>
        <td>
          {{comment.lc_comment}}
        </td>
      </tr>
      <tr>
        <td>
          <!-- 이 input은 data의 inputName와 연결됩니다. -->
          <input v-model="inputName" placeholder="이름"/>
        </td>
        <td>
          <!-- 이 input은 data의 inputComment와 연결됩니다. -->
          <input v-model="inputComment" placeholder="댓글을 입력하세요."
            v-on:keyup.enter="submitComment"/>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: 'lecture-detail',
  // 데이터가 들어가는 곳입니다.
  data: function() {
    return {
      idx: null,
      lecture: null,
      commentList: [],
      inputName: '',
      inputComment: '',
      submitting: false
    }
  },
  // 함수들을 지정하는 곳입니다.
  methods: {
    // 댓글들을 받아오는 함수입니다.
    getComments: function () {
      let _this = this
      // 아래 주소에서 댓글들을 받아와서
      _this.$axios.get(`http://127.0.0.1:8000/api/lec_comments/${this.idx}/`)
      .then((response) => {
        // 기존 commentList를 비우고
        _this.commentList.splice(0, _this.commentList.length)
        // 받아온 댓글들로 채웁니다.
        _this.commentList = _this.commentList.concat(response.data)
      })
    },
    // 댓글을 올리는 함수입니다.
    submitComment: function () {
      let _this = this
      // 이미 댓글을 올리는 중이거나 입력된 이름이나 댓글이 비어있으면 중단합니다
      if (_this.submitting 
        || _this.inputName.trim().length === 0
        || _this.inputComment.trim().length === 0) return
      _this.submitting = true
      // 서버에 보낼 내용입니다.
      let toSend = {
        lec_idx: _this.idx,
        lc_name: _this.inputName,
        lc_comment: _this.inputComment
      }
      // 아래 주소로 서버에 댓글 입력내용을 보냅니다
      _this.$axios.post(`http://127.0.0.1:8000/api/lec_comments/${this.idx}/`,
        _this.$qs.stringify(toSend), {
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
          // 보내졌다는 응답이 오면
        }).then((response) => {
          // 댓글들을 새로 받아오고
            _this.getComments()
            // 이름과 댓글 입력칸을 비워주고
            _this.inputName = ''
            _this.inputComment = ''
            // '보내는 중'을 해지합니다
            _this.submitting = false
        })
    }
  },
  // 페이지가 열리면 실행되는 명령어입니다.
  mounted () {
    let _this = this
    _this.idx = _this.$route.params.idx
    // 페이지에 주어진 idx 번호에 해당하는 강의를 받아옵니다.
    _this.$axios.get(`http://127.0.0.1:8000/api/lectures/${this.idx}/`)
    .then((response) => {
      _this.lecture = response.data
    })
    _this.getComments()
  }
}
</script>

<style lang="scss" scoped>
  @import '../assets/scss/lecture.scss'
</style>
