
var data = [{ "year": "1399", "total_amount": 261030227452, "month": "اردیبهشت" }, { "year": "1399", "total_amount": 9031830306, "month": "فروردین" }, { "year": "1399", "total_amount": 182380249124, "month": "خرداد" }, { "year": "1399", "total_amount": 278296720111, "month": "تیر" }, { "year": "1399", "total_amount": 187960643020.34, "month": "مرداد" }, { "year": "1399", "total_amount": 297334141314, "month": "شهریور" }, { "year": "1399", "total_amount": 237625545574, "month": "مهر" }, { "year": "1399", "total_amount": 300427980823.95, "month": "آبان" }, { "year": "1399", "total_amount": 241806530275, "month": "آذر" }, { "year": "1399", "total_amount": 365518747961, "month": "دی" }, { "year": "1399", "total_amount": 396794166615, "month": "بهمن" }, { "year": "1399", "total_amount": 267357717876.46, "month": "اسفند" }, { "year": "1400", "total_amount": 180233244119, "month": "فروردین" }, { "year": "1400", "total_amount": 366456330510, "month": "اردیبهشت" }, { "year": "1400", "total_amount": 354151492001, "month": "خرداد" }, { "year": "1400", "total_amount": 341757187584.96, "month": "تیر" }, { "year": "1400", "total_amount": 346913160474.68, "month": "مرداد" }, { "year": "1400", "total_amount": 475207677524, "month": "شهریور" }, { "year": "1400", "total_amount": 351521141035, "month": "مهر" }, { "year": "1400", "total_amount": 495468531463, "month": "آبان" }, { "year": "1400", "total_amount": 455325033965, "month": "آذر" }, { "year": "1400", "total_amount": 419242797333, "month": "دی" }, { "year": "1400", "total_amount": 578044352011, "month": "بهمن" }, { "year": "1400", "total_amount": 549884961659, "month": "اسفند" }, { "year": "1401", "total_amount": 137857138993, "month": "فروردین" }, { "year": "1401", "total_amount": 551386141858, "month": "اردیبهشت" }, { "year": "1401", "total_amount": 674774450578, "month": "خرداد" }, { "year": "1401", "total_amount": 439608725737, "month": "مرداد" }, { "year": "1401", "total_amount": 578601576101, "month": "تیر" }, { "year": "1401", "total_amount": 631019229788, "month": "شهریور" }, { "year": "1401", "total_amount": 330290728429.95, "month": "مهر" }, { "year": "1401", "total_amount": 608709778969, "month": "آبان" }, { "year": "1401", "total_amount": 912796515690, "month": "آذر" }, { "year": "1401", "total_amount": 906211388069.4, "month": "دی" }, { "year": "1401", "total_amount": 838240613976.2, "month": "بهمن" }, { "year": "1401", "total_amount": 467853492346.8, "month": "اسفند" }, { "year": "1402", "total_amount": 172140022532, "month": "فروردین" }, { "year": "1402", "total_amount": 644067142718, "month": "خرداد" }, { "year": "1402", "total_amount": 928852998219.22, "month": "اردیبهشت" }, { "year": "1402", "total_amount": 794471150319.59, "month": "تیر" }, { "year": "1402", "total_amount": 780415574167.9, "month": "مرداد" }, { "year": "1402", "total_amount": 743006181878.2, "month": "شهریور" }, { "year": "1402", "total_amount": 576390274861.2, "month": "مهر" }, { "year": "1402", "total_amount": 863705068556.6, "month": "دی" }, { "year": "1402", "total_amount": 821879072392.7, "month": "آذر" }, { "year": "1402", "total_amount": 686956757640.4, "month": "آبان" }, { "year": "1402", "total_amount": 977176181135.9, "month": "بهمن" }, { "year": "1402", "total_amount": 730697099443.6, "month": "اسفند" }, { "year": "1403", "total_amount": 165547907060, "month": "فروردین" }, { "year": "1403", "total_amount": 549164106539, "month": "خرداد" }, { "year": "1403", "total_amount": 582437877426, "month": "اردیبهشت" }, { "year": "1403", "total_amount": 850918258693, "month": "مهر" }, { "year": "1403", "total_amount": 523242427055, "month": "تیر" }, { "year": "1403", "total_amount": 930845398166, "month": "مرداد" }, { "year": "1403", "total_amount": 808210093302, "month": "شهریور" }, { "year": "1403", "total_amount": 939844359327, "month": "آبان" }, { "year": "1403", "total_amount": 698427974856, "month": "آذر" }, { "year": "1403", "total_amount": 1041282677758, "month": "اسفند" }, { "year": "1403", "total_amount": 1345312634972, "month": "دی" }, { "year": "1403", "total_amount": 1508922282354, "month": "بهمن" }, { "year": "1404", "total_amount": 1142564483543.5, "month": "اردیبهشت" }, { "year": "1404", "total_amount": 364146543412, "month": "فروردین" }];

const monthOrder = ["فروردین", "اردیبهشت", "خرداد", "تیر", "مرداد", "شهریور", "مهر", "آبان", "آذر", "دی", "بهمن", "اسفند"];

// مرتب‌سازی داده‌ها بر اساس تاریخ شمسی
data.sort((a, b) => monthOrder.indexOf(a.month) - monthOrder.indexOf(b.month));

// تبدیل مقادیر SUM به میلیارد تومان
data.forEach(item => {
    item.total_amount = parseFloat((item.total_amount / 1e10).toFixed(3)); // تبدیل به میلیارد تومان
});

// استخراج داده‌ها برای Highcharts
const seriesData = [];
const years = {};

// اضافه کردن داده‌های سال به سری‌ها
data.forEach(item => {
    if (!years[item.year]) {
        years[item.year] = {
            name: item.year,
            data: new Array(12).fill(null)
        };
        seriesData.push(years[item.year]);
    }

    const index = monthOrder.indexOf(item.month);
    years[item.year].data[index] = {
        name: item.month,
        y: item.total_amount,
        year: item.year,
        visible: item.total_amount !== null
    };
});

// Highcharts Configuration
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'فروش سال‌های 1399 تا 1404 به تفکیک ماه (میلیارد تومان)'
    },
    xAxis: {
        categories: monthOrder
    },
    yAxis: {
        title: {
            text: 'فروش (میلیارد تومان)'
        },
        labels: {
            formatter: function () {
                return this.value; // بدون افزودن M
            }
        }
    },
    tooltip: {
        formatter: function () {
            return '<b>' + this.point.category + '</b><br/>' +
                this.series.name + ' : ' + this.point.y + ' میلیارد تومان';
        }
    },

    series: seriesData
});