<!-- Wide card with share menu button -->
<div class="main-card-wide mdl-card mdl-shadow--16dp">
    <div class="mdl-card__menu">
        <g:javascript>
            function resetGame(){
                $.ajax({
                    url:'${g.createLink( controller:"Node", action:"resetGame" )}',
                    success: function(result){
                        reloadGame()
                    }
                });
              };

        </g:javascript>
        <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect" href="javascript:void(0)" onclick="resetGame();return false;">
            <i id="reset-button" class="material-icons">autorenew</i></button>
        </button>

    </div>
    <div class="mdl-card__title">
        <h2 class="mdl-card__title-text">Guessing Game</h2>
    </div>
    <div id="message" class="mdl-card__supporting-text">
        <p> Would you belive if I tell you that I can read your mind? No? </p>
        <p> Ok then, let's play a simple guessing game.</p>
        <p> Think of an animal ... </p>
        <p> Ok? Ready? Click on the "Start" button below so we can start.</p>
    </div>
    <div class="mdl-card__actions mdl-card--border">
        <g:remoteLink  id="button-get-started" action="getFirstQuestion" controller="node" update="message" onComplete="showButtonsYesNo()" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Start</g:remoteLink>
        <g:remoteLink  id="button-yes" action="getLeftNode" controller="node" update="message" style="display:none" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">Yes</g:remoteLink>
        <g:remoteLink  id="button-no" action="getRightNode" controller="node" update="message" onFailure="showCreateAnimal()" style="display:none" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">No</g:remoteLink>
    </div>
</div>
