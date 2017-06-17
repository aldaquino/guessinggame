<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Animal Guessing Game</title>
    </head>

    <body>
        <g:include controller="node" action="initGame"/>

        <g:render template="node/node"></g:render>

        <!-- modal input dialog-->
        <dialog id="dialog-animal" class="mdl-dialog">
            <h4 class="mdl-dialog__title">What was the animal you thought?</h4>
            <div class="mdl-dialog__content">
                <p>
                    Enter the name of the animal:
                </p>
                <!-- Simple Textfield -->
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="animal-name" name="animal-name"/>
                    <label class="mdl-textfield__label" for="animal-name">Animal</label>
                </div>
            </div>
            <div class="mdl-dialog__actions">
                <g:javascript>
                var createAnimal = function(){
                    var animalName = getAnimalName();
                    ${remoteFunction(action:"createAnimal", controller: "animal", update:"question-dialog-message", params: '\'name=\' + animalName', onComplete:"showCreateQuestion()")}
                    };
                </g:javascript>
                <a id="button-create-animal" class="mdl-button close" href="javascript:void(0)" onclick="createAnimal();return false;">Ok</a>
            </div>
        </dialog>
        <!-- modal input dialog-->
        <dialog id="dialog-question" class="mdl-dialog">
            <h4 id="question-dialog-message" class="mdl-dialog__title"></h4>
            <div class="mdl-dialog__content">
                <p>
                    Please complete the sentence above:
                </p>
                <!-- Simple Textfield -->
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="question-text" name="question-text"/>
                    <label class="mdl-textfield__label" for="question-text">Diference</label>
                </div>
            </div>
            <div class="mdl-dialog__actions">
                <g:javascript>
                var createQuestion = function(){
                    var questionText = getQuestionText();
                    ${remoteFunction(action:"createQuestion", controller: "question", params: '\'text=\' + questionText', onComplete:"reloadGame()")}
                };
                </g:javascript>
                <a id="button-create-question" class="mdl-button close" href="javascript:void(0)" onclick="createQuestion();return false;">Ok</a>
            </div>
        </dialog>
        <!-- modal input dialog javascript-->
        <script>
            console.log("showDialog");
            var dialogA = document.getElementById('dialog-animal');
            var dialogQ = document.getElementById('dialog-question');
            if (! dialogA.showModal) {
                dialogPolyfill.registerDialog(dialogA);
            }
            if (! dialogQ.showModal) {
                dialogPolyfill.registerDialog(dialogQ);
            }
            dialogA.querySelector('.close').addEventListener('click', function() {
                dialogA.close();
            });
            dialogQ.querySelector('.close').addEventListener('click', function() {
                dialogQ.close();
            });
        </script>
    </body>
</html>

%{-- <!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
    <content tag="nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application Status <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
                <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
                <li><a href="#">App version:
                    <g:meta name="info.app.version"/></a>
                </li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Grails version:
                    <g:meta name="info.app.grailsVersion"/></a>
                </li>
                <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
                <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artefacts <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
                <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
                <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
                <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Installed Plugins <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                    <li><a href="#">${plugin.name} - ${plugin.version}</a></li>
                </g:each>
            </ul>
        </li>
    </content>

    <div class="svg" role="presentation">
        <div class="grails-logo-container">
            <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
        </div>
    </div>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1>Welcome to Grails</h1>

            <p>
                Congratulations, you have successfully started your first Grails application! At the moment
                this is the default page, feel free to modify it to either redirect to a controller or display
                whatever content you may choose. Below is a list of controllers that are currently deployed in
                this application, click on each to execute its default action:
            </p>

            <div id="controllers" role="navigation">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller">
                            <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
        </section>
    </div>

</body>
</html>
 --}%
