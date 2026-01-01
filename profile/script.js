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
