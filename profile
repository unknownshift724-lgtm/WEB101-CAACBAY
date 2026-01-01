
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="profile-container">
        <h1>User Profile</h1>
        <div class="profile-field">
            <strong>Name:</strong> <span id="name">John Doe</span>
        </div>
        <div class="profile-field">
            <strong>Hobby:</strong> <span id="hobby">Reading</span>
        </div>
        <div class="profile-field">
            <strong>Goal:</strong> <span id="goal">Learn to code</span>
        </div>
        <div class="profile-field">
            <strong>Sports:</strong> <span id="sports">Soccer</span>
        </div>
        <button id="editBtn">Edit Profile</button>
    </div>
    <script src="script.js"></script>
</body>
</html>

document.addEventListener('DOMContentLoaded', () => {
    loadProfile();

    const editBtn = document.getElementById('editBtn');
    editBtn.addEventListener('click', () => {
        if (editBtn.textContent === 'Edit Profile') {
            editProfile();
        } else {
            saveProfile();
        }
    });
});

function loadProfile() {
    const profile = JSON.parse(localStorage.getItem('userProfile'));
    if (profile) {
        document.getElementById('name').textContent = profile.name;
        document.getElementById('hobby').textContent = profile.hobby;
        document.getElementById('goal').textContent = profile.goal;
        document.getElementById('sports').textContent = profile.sports;
    }
}

function editProfile() {
    const fields = ['name', 'hobby', 'goal', 'sports'];
    fields.forEach(field => {
        const span = document.getElementById(field);
        const value = span.textContent;
        const input = document.createElement('input');
        input.type = 'text';
        input.value = value;
        input.id = `${field}-input`;
        span.replaceWith(input);
    });
    document.getElementById('editBtn').textContent = 'Save Profile';
}

function saveProfile() {
    const profile = {
        name: document.getElementById('name-input').value,
        hobby: document.getElementById('hobby-input').value,
        goal: document.getElementById('goal-input').value,
        sports: document.getElementById('sports-input').value,
    };
    localStorage.setItem('userProfile', JSON.stringify(profile));

    const fields = ['name', 'hobby', 'goal', 'sports'];
    fields.forEach(field => {
        const input = document.getElementById(`${field}-input`);
        const value = input.value;
        const span = document.createElement('span');
        span.id = field;
        span.textContent = value;
        input.replaceWith(span);
    });
    document.getElementById('editBtn').textContent = 'Edit Profile';
}


body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.profile-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
}

h1 {
    text-align: center;
}

.profile-field {
    margin-bottom: 15px;
}

input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}
