App.draft_picks = App.cable.subscriptions.create({channel:'DraftPicksChannel', id: window.location.pathname.split('/')[2]}, {  
  received: function(data) {
  	$(`#player_team_player_id_${data.player.id}`).parent().remove();
  	if ($('.picks').children().length >= 10)
  		$('.picks').children()[0].remove();
    return $('.picks').append(this.renderDraftPick(data));
  },

  renderDraftPick: function(data) {
    return `<div class='col m3 l2 xl1'>
    <div class='card small'>
    <div class='card-content'>
    <span class = 'card-action'>
      <p>${data.team.name}</p></span>
      <div class='card-title'>
      <p>${data.player.name}</p>
       <p>${data.player.position}</p>
       <br>
       <image src='/assets/${data.player.nfl_team}.png', width='64'>
       </div>
       </div>
    </div>
    </div>`;
  }
});