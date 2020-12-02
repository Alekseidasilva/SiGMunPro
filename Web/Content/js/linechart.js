new Chart(document.getElementById("linechart"), {
	type: 'line',
	data: {
		labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
		datasets: [{
			label: 'A. Residencia',
			backgroundColor: window.chartColors.navy,
			borderColor: window.chartColors.navy,
			data: [100,80,60,40,20,0,20,40,60,80],
			fill: false,
		}, 
        {
			label: 'Agreg.Familiar',
			fill: false,
			backgroundColor: window.chartColors.purple,
			borderColor: window.chartColors.purple,
			data: [5,9,19,29,39,49,59,69,79,89,99],
		},
        {
			label: 'At. Pobreza',
			fill: false,
			backgroundColor: window.chartColors.blue,
			borderColor: window.chartColors.blue,
			data: [3,7,13,18,25,31,38,42,49,61,82],
		},
        {
			label: 'L. Motociclo',
			fill: false,
			backgroundColor: window.chartColors.danger,
			borderColor: window.chartColors.danger,
			data: [10,40,20,35,25,50,10,70,80,90,100],
		},
         {
			label: 'Reg. Velocípedes',
			fill: false,
			backgroundColor: window.chartColors.green,
			borderColor: window.chartColors.green,
			data: [10,40,20,35,25,50,10,70,80,90,100],
		}]
	},
	options: {
		responsive: true,
		// title: {
		// 	display: true,
		// 	text: 'Chart.js Line Chart'
		// },
		tooltips: {
			mode: 'index',
			intersect: false,
		},
		hover: {
			mode: 'nearest',
			intersect: true
		},
		scales: {
			xAxes: [{
				display: true,
				scaleLabel: {
					display: true,
					labelString: 'Meses'
				}
			}],
			yAxes: [{
				display: true,
				scaleLabel: {
					display: true,
					labelString: 'Valores'
				}
			}]
		}
	}
});
