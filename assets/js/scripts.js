function showAddDeckInput() {
    var addDeckContainer = document.querySelector('.add-deck-container');
    var plusSign = addDeckContainer.querySelector('.plus-sign');
    var addDeckInput = addDeckContainer.querySelector('.add-deck-input');

    // Hide plus sign and show input field
    plusSign.style.display = 'none';
    addDeckInput.style.display = 'block';
}
function addCard(cardElement) {
    const selectedCardsSection = document.getElementById('selected-cards');
    const cardClone = cardElement.cloneNode(true);
    cardClone.classList.add('selected-card');
    cardClone.onclick = null; // Remove the click event to prevent adding again
    selectedCardsSection.appendChild(cardClone);
}