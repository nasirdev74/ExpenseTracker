import SwiftUI
import SwiftUICharts

struct ChartView: View {
		@EnvironmentObject var transactionListVM: TransactionListViewModel
		var body: some View {
				let data = transactionListVM.accumulateTransactions()
				if !data.isEmpty {
						let totalExpenses = data.last?.1 ?? 0
						CardView {
								VStack(alignment: .leading) {
										ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
										LineChart()
								}
								.background(Color.systemBackground)
						}
						.data(data)
						.chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
						.frame(height: 300)
						.background(Color.systemBackground)
				} else {
						Text("Chart is loading")
								.font(.title)
				}
		}
}

struct ChartView_Previews: PreviewProvider {
		static var previews: some View {
				ChartView()
		}
}
