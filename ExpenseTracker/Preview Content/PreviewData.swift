import Foundation
var transactionPreviewData = Transaction(id: 1 , date: "1/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 701, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)
var transactionListPreviewData = [Transaction] (repeating: transactionPreviewData, count: 10)
