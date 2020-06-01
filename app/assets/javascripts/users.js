$(function() {
  function addUser(user) {
    let html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">${user.name}</p>
        <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
      </div>
    `;
    $("#user-search-result").append(html); //appendメソッド HTMLを描画
  }

  function addNoUser() {
    let html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#user-search-result").append(html); //appendメソッド HTMLを描画
  }
  function addDeleteUser(name, id) {
    let html = `
    <div class="chat-group-user clearfix" id="${id}">
      <p class="chat-group-user__name">${name}</p>
      <div class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data-user-id="${id}" data-user-name="${name}">削除</div>
    </div>`;
    $(".js-add-user").append(html);
  }
  function addMember(userId) {
    let html = `<input value="${userId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${userId}" />`;
    $(`#${userId}`).append(html);
  }
  //
  $("#user-search-field").on("keyup", function() {
    let input = $("#user-search-field").val();

    $.ajax({
      type: "GET",
      url: "/users",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(users) {
        $("#user-search-result").empty();
        if (users.length !== 0) {
          users.forEach(function(user) {
            console.log(1)
            addUser(user); //文字列が含まれているので、追加できる 
          });
        } else if (input.length == 0) {
          return false; //返り値が無い場合を記述
        } else {
          addNoUser(); //文字列が無いので、追加できない
        }
      })
      .fail(function() {
        alert("通信エラーです。ユーザーが表示できません。");
      });
  });
  $(document).on("click", ".chat-group-user__btn--add", function() {
    //$(document).onすることで常に最新のHTMLの情報を取得する
    const userName = $(this).attr("data-user-name");
    const userId = $(this).attr("data-user-id");
    $(this) //追加ボタンの対象であるユーザー情報を変数へ代入、HTMLを描画
      .parent()
      .remove(); //検索結果欄からremoveメソッドを使用してHTMLは削除
    addDeleteUser(userName, userId);
    addMember(userId); //user_ids: [2,3]
  });
  $(document).on("click", ".chat-group-user__btn--remove", function() {
    $(this)
      .parent()
      .remove();
  });
});

// $(document).onすることで常に最新のHTMLの情報を取得
// 今回だとappendさせて作成したHTMLから情報を取得する際、documentを用いることで値の取得を可能にしています。