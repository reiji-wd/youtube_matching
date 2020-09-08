import consumer from "./consumer"

  consumer.subscriptions.create("UserChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      if(data.notice) {
        $('#notices').prepend(data.notice);
        var el = document.querySelector('.new-notice');
        var otherel = document.querySelector('.new-notice-count')
        if(otherel == undefined) {
          var newNotice = "1";
          el.innerHTML = `<div class="new-notice-count">${newNotice}</div>`
        } else {
          var counts = Number(otherel.textContent);
          counts += 1;
          String(counts);
          otherel.textContent = counts;
        }
        const notices = document.querySelector(".notices");
        if(notices == undefined) {
          this.noticecheck(data.notice);
        }
      }
      
      if(data.request) {
        $('#requests').prepend(data.request);
      }
  
      if(data.post) {
        if(data.mine) {
          var html = data.mine
        }
        if(data.theirs) {
          var html = data.theirs
        }
        $('.posts').prepend(html);
      }
      
      if(data.message) {
        var rooms = document.querySelector('.rooms');
        var roomId = document.querySelector(`.room-${data.message.room_id}`)
        const roomShow = document.querySelector(`[data-room-id="${data.message.room_id}"]`);
        var newMessageCount = document.querySelector(`.new-message-count-${data.message_room_id}`)
        // ルーム一覧ページにいれば実行
        if(rooms != undefined) {
          // ルーム一覧ページでルームがなかったら一番上に追加
          if(roomId == undefined) {
            rooms.insertAdjacentHTML('afterbegin', data.html);
          } else {
            // ルームがあれば、一度削除して一番上に追加
            roomId.remove();
            rooms.insertAdjacentHTML('afterbegin', data.html);
          }
          // 未読メッセージがなければカウントする要素をルーム下に追加
          if(newMessageCount == undefined) {
            roomId.innerHTML = `<div class="new-message-count-${data.message.room_id}">1</div>`;
          } else {
              // 表示されている未読の数を取得し1ずつ増やす
            var counts = Number(newMessageCount.textContent);
            counts += 1;
            String(counts)
            newMessageCount.textContent = counts;
          }
        }
        // メッセージが来たとき、もしルームが表示されていたら既読をつける
        if(roomShow != undefined) {
          this.messagecheck(data.message);
        }
      }
    },
  
    messagecheck: function(message) {
      return this.perform('messagecheck', {
        message: message
      });
    },
  
    noticecheck: function(notice) {
      return this.perform('noticecheck', {
        notice: notice
      })
    }
  });


