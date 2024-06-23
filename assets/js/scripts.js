function showAddDeckInput() {
    var addDeckContainer = document.querySelector('.add-deck-container');
    var plusSign = addDeckContainer.querySelector('.plus-sign');
    var addDeckInput = addDeckContainer.querySelector('.add-deck-input');

    // Hide plus sign and show input field
    plusSign.style.display = 'none';
    addDeckInput.style.display = 'block';
}