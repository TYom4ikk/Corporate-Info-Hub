const monthYearElement = document.getElementById("monthYear");
const daysElement = document.getElementById("days");
const prevMonthButton = document.getElementById("prevMonth");
const nextMonthButton = document.getElementById("nextMonth");

let currentDate = new Date();

function renderCalendar() {
    const year = currentDate.getFullYear();
    const month = currentDate.getMonth();

    // Устанавливаем заголовок с месяцем и годом
    monthYearElement.innerText = currentDate.toLocaleString('default', { month: 'long' }) + ' ' + year;

    // Очищаем дни перед рендерингом
    daysElement.innerHTML = '';

    // Получаем первый день месяца
    const firstDayOfMonth = new Date(year, month, 1);

    // Получаем количество дней в месяце
    const daysInMonth = new Date(year, month + 1, 0).getDate();

    // Получаем день недели первого дня месяца (0 - воскресенье)
    const firstDayIndex = firstDayOfMonth.getDay();

    // Корректируем так, чтобы неделя начиналась с понедельника
    const adjustedFirstDayIndex = (firstDayIndex === 0 ? 6 : firstDayIndex - 1);

    // Добавляем пустые ячейки для дней перед первым днем месяца
    for (let i = 0; i < adjustedFirstDayIndex; i++) {
        daysElement.innerHTML += '<div></div>';
    }

    // Добавляем дни месяца
    for (let day = 1; day <= daysInMonth; day++) {
        daysElement.innerHTML += `<div>${day}</div>`;
    }
}

// Обработчики событий для кнопок переключения месяцев
prevMonthButton.addEventListener("click", () => {
    currentDate.setMonth(currentDate.getMonth() - 1);
    renderCalendar();
});

nextMonthButton.addEventListener("click", () => {
    currentDate.setMonth(currentDate.getMonth() + 1);
    renderCalendar();
});

// Инициализация календаря
renderCalendar();