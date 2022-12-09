import SwiftUI

struct TransactionList: View {
		@EnvironmentObject var transactionListVM: TransactionListViewModel
		
		var body: some View {
				VStack {
						VStack {
								List {
										// MARK: Transaction Groups
										ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month, transactions in
												Section {
														// MARK: Transaction List
														ForEach(transactions) { transaction in
																TransactionRow(transaction: transaction)
														}
												} header: {
														// MARK: Transaction month
														Text(month)
												}
												.listSectionSeparator(.hidden)
										}
								}
								.listStyle(.plain)
						}
				}
				.navigationTitle("Transactions")
				.navigationBarTitleDisplayMode(.inline)
		}
}

struct TransactionList_Previews: PreviewProvider {
		static let transactionListVM: TransactionListViewModel = {
				let transactionListVM = TransactionListViewModel()
				transactionListVM.transactions = [transactionPreviewData]
				return transactionListVM
		}()
		
		static var previews: some View {
				Group {
						NavigationView {
								TransactionList()
						}
						
						NavigationView {
								TransactionList()
						}
						.preferredColorScheme(.dark)
				}
				.environmentObject(transactionListVM)
		}
}
