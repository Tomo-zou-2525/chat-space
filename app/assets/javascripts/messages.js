$(function(){
      function buildHTML(message){
        if ( message.image ) {
          var html =
          `<div class="chat-main__messages__box">
              <div class="chat-main__messages__box__info">
                <div class="chat-main__messages__box__info__user">
                  ${message.user_name}
                </div>
                <div class="chat-main__messages__box__info__date">
                  ${message.created_at}
                </div>
              </div>
              <div class="chat-main__messages__box__text">
                <p class="lower-message__body">
                  ${message.body}
                </p>
              </div>
              <img src=${message.image} >
            </div>`
          return html;
        } else {
          var html =
          `<div class="chat-main__messages__box">
              <div class="chat-main__messages__box__info">
                <div class="chat-main__messages__box__info__user">
                  ${message.user_name}
                </div>
                <div class="chat-main__messages__box__info__date">
                  ${message.created_at}
                </div>
              </div>
              <div class="chat-main__messages__box__text">
                <p class="lower-message__body">
                  ${message.body}
                </p>
              </div>
            </div>`
          return html;
        };
      }
  $("#new_message").on("submit",function(e){
    e.preventDefault()
    var formdata = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formdata,
      dataType: "json",
      processData: false,
      contentType: false
    })
      .done(function(data){
        var html = buildHTML(data);
        $('.chat-main__messages').append(html);
        $('.chat-main__messages').animate({ scrollTop: $('.chat-main__messages')[0].scrollHeight});
        $('form')[0].reset();
        $('.message__submit-btn').prop("disabled", "");
      }) //受け取ったHTMLを、appendメソッドによって.messagesというクラスが適用されているdiv要素の子要素の一番最後に追加します。また、フォームを空にする処理も書きます。
      .always(function(){
        $('.message__submit-btn').prop("disabled", "");
      })
      .fail(function() {
        alert("メッセージ送信に失敗しました")
      });
  })
});

 //ajax関数ではいくつかのパラメータを指定できますが、その中のurlがパス、typeがhttpメソッドを表します。今回リクエストを送りたいパスはフォームのaction属性に格納されているので、$(this).attr('action')という記述でその情報を取得しています。

 //attrメソッドについて//attrメソッドによって、引数に指定した属性の値を取得することができます。// 今回は引数に'action'を指定しているので、form要素のaction属性の値が取得できます./groups/:id番号/messagesとなっており、必要なパスとなることがわかります。