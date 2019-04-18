console.log('JS est bien chargé');

// L'AJAX se lance en cliquant sur le button
$('#likes button').on('click', function(){
    // Récupération de l'id
    const id = $('#likes button'). first().data('id');

const params ={
    url:'http://blog2local/api/article/likes/'+id
};


// Lancement de l'appel AJAX
$.ajax(params).done(displayNewLikes);
});

function displayNewLikes (json){
    // Affiche le nouvelle valeur du nombre de likes
    $('#likes span').text(json.cpt);
}