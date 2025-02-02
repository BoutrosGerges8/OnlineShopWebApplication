// Retrieve the error message from the URL query parameters
const urlParams = new URLSearchParams(window.location.search);
const errorMessage = urlParams.get('Error');

if (errorMessage) {
    // Create and append the <h1> element with the error message
    const errorElement = document.createElement('h1');
    errorElement.id = 'Error';
    //errorElement.textContent = errorMessage;
    errorElement.textContent = "Couldn\'t login, worng email or password!";
    errorElement.style.cssText = `
        background-color: white;
        color: red;
        font-size: 17px;
        position: absolute;
        top: 10%;
        left: 50%;
        transform: translateX(-50%);
        z-index: 10000;
        text-align: center;
        width: 70vw;
        border-radius: 20px;
        padding: 20px 30px;
        transition: opacity 1s;
    `;
    document.body.appendChild(errorElement);

    setTimeout(() => {
        errorElement.style.opacity = '0';
    }, 3000);
    setTimeout(() => {
        errorElement.remove();
    }, 4000);
    
}
