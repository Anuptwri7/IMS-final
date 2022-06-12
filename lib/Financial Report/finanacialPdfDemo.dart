import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'mobilepdf.dart';
// import 'save_file_mobile.dart' if (dart.library.html) 'save_file_web.dart';

Future<void> generateInvoice() async {
  //Create a PDF document.
  final PdfDocument document = PdfDocument();
  //Add page to the PDF
  final PdfPage page = document.pages.add();
  //Get page client size
  final Size pageSize = page.getClientSize();
  // Draw rectangle
  // page.graphics.drawRectangle(
  //     bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
  //     pen: PdfPen(PdfColor(142, 170, 219)));
  //Generate PDF grid.
  final PdfGrid grid = getGrid();
  //Draw the header section by creating text element
  final PdfLayoutResult result = drawHeader(page, pageSize, grid);
  //Draw grid
  drawGrid(page, grid, result);
  //Add invoice footer
  // drawFooter(page, pageSize);
  //Save the PDF document

  final List<int> bytes = document.save();
  //Dispose the document.

  document.dispose();
  //Save and launch the file.

  await saveAndLaunchFile(bytes, 'Invoice.pdf');
}

//Draws the invoice header
PdfLayoutResult drawHeader(PdfPage page, Size pageSize, PdfGrid grid) {
  //Draw rectangle
  page.graphics.drawRectangle(
      brush: PdfSolidBrush(PdfColor(91, 126, 215)),
      bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 90));
  //Draw string
  page.graphics.drawString(
      'Party Payment Reports', PdfStandardFont(PdfFontFamily.helvetica, 30),
      brush: PdfBrushes.white,
      bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
      format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
      brush: PdfSolidBrush(PdfColor(65, 104, 205)));

  // page.graphics.drawString(r'$' + getTotalAmount(grid).toString(),
  //     PdfStandardFont(PdfFontFamily.helvetica, 18),
  //     bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 100),
  //     brush: PdfBrushes.white,
  //     format: PdfStringFormat(
  //         alignment: PdfTextAlignment.center,
  //         lineAlignment: PdfVerticalAlignment.middle));

  final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
  //Draw string
  page.graphics.drawString(
      '''Soori IMS''', PdfStandardFont(PdfFontFamily.helvetica, 18),
      brush: PdfBrushes.white,
      bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 33),
      format: PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.bottom));
  //Create data foramt and convert it to text.
  final DateFormat format = DateFormat.yMMMMd('en_US');
  final String date =
      'Printed Data/Time: ${format.format(DateTime.now())}\r\n\r\nPrinted By: ';
  final Size contentSize = contentFont.measureString(date);
  // ignore: leading_newlines_in_multiline_strings
  const String address = '''Date Range:2022-07-2 to 2022-08-01 \r\n\r\n, 
       ''';

  PdfTextElement(text: date, font: contentFont).draw(
      page: page,
      bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
          contentSize.width + 30, pageSize.height - 120));

  return PdfTextElement(text: address, font: contentFont).draw(
      page: page,
      bounds: Rect.fromLTWH(30, 120, pageSize.width - (contentSize.width + 30),
          pageSize.height - 120))!;
}

//Draws the grid
void drawGrid(PdfPage page, PdfGrid grid, PdfLayoutResult result) {
  Rect? totalPriceCellBounds;
  Rect? quantityCellBounds;
  //Invoke the beginCellLayout event.
  grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
    final PdfGrid grid = sender as PdfGrid;
    if (args.cellIndex == grid.columns.count - 1) {
      totalPriceCellBounds = args.bounds;
    } else if (args.cellIndex == grid.columns.count - 2) {
      quantityCellBounds = args.bounds;
    }
  };
  //Draw the PDF grid and get the result.
  result = grid.draw(
      page: page, bounds: Rect.fromLTWH(0, result.bounds.bottom + 40, 0, 0))!;

  //Draw grand total.
  page.graphics.drawString('Grand Total',
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: Rect.fromLTWH(quantityCellBounds!.left, result.bounds.bottom + 10,
          quantityCellBounds!.width, quantityCellBounds!.height));
  page.graphics.drawString(getTotalAmount(grid).toString(),
      PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
      bounds: Rect.fromLTWH(
          totalPriceCellBounds!.left,
          result.bounds.bottom + 10,
          totalPriceCellBounds!.width,
          totalPriceCellBounds!.height));
}

//Draw the invoice footer data.
// void drawFooter(PdfPage page, Size pageSize) {
//   final PdfPen linePen =
//       PdfPen(PdfColor(142, 170, 219), dashStyle: PdfDashStyle.custom);
//   linePen.dashPattern = <double>[3, 3];
//   //Draw line
//   page.graphics.drawLine(linePen, Offset(0, pageSize.height - 100),
//       Offset(pageSize.width, pageSize.height - 100));

//   const String footerContent =
//       // ignore: leading_newlines_in_multiline_strings
//       '''Soori Ims pvt ltd.\r\n\r\nKalikasthan, kathmandu,
//          \r\n\r\nAny Questions? support@soori-ims.com''';

//   //Added 30 as a margin for the layout
//   page.graphics.drawString(
//       footerContent, PdfStandardFont(PdfFontFamily.helvetica, 9),
//       format: PdfStringFormat(alignment: PdfTextAlignment.right),
//       bounds: Rect.fromLTWH(pageSize.width - 30, pageSize.height - 70, 0, 0));
// }

//Create PDF grid and return
PdfGrid getGrid() {
  //Create a PDF grid
  final PdfGrid grid = PdfGrid();
  //Secify the columns count to the grid.
  grid.columns.add(count: 5);
  //Create the header row of the grid.
  final PdfGridRow headerRow = grid.headers.add(1)[0];
  //Set style
  headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
  headerRow.style.textBrush = PdfBrushes.white;
  headerRow.cells[0].value = 'Receipt No';
  headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
  headerRow.cells[1].value = 'Purchase No';
  headerRow.cells[2].value = 'Supplier';
  headerRow.cells[3].value = 'Paid Amount';
  headerRow.cells[4].value = 'Due Amount';
  // headerRow.cells[5].value = 'Grand Total';

  //Add rows
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);

  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);

  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);

  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);

  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);

  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);

  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);
  addProducts(
      'RE-78/79-0000001 ', 'PU-78/79-0000001 ', 'Wacom', 0, 17.98, grid);

  //Apply the table built-in style
  grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
  //Set gird columns width
  grid.columns[1].width = 200;
  for (int i = 0; i < headerRow.cells.count; i++) {
    headerRow.cells[i].style.cellPadding =
        PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
  }
  for (int i = 0; i < grid.rows.count; i++) {
    final PdfGridRow row = grid.rows[i];
    for (int j = 0; j < row.cells.count; j++) {
      final PdfGridCell cell = row.cells[j];
      if (j == 0) {
        cell.stringFormat.alignment = PdfTextAlignment.center;
      }
      cell.style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
  }
  return grid;
}

//Create and row for the grid.
void addProducts(String receiptNo, String purchaseNo, String supplier,
    double paidAmount, double dueAmount, PdfGrid grid) {
  final PdfGridRow row = grid.rows.add();
  row.cells[0].value = receiptNo;
  row.cells[1].value = purchaseNo;
  row.cells[2].value = supplier;
  row.cells[3].value = paidAmount.toString();
  row.cells[4].value = dueAmount.toString();
  // row.cells[5].value = grandTotal.toString();
}

//Get the total amount.
double getTotalAmount(PdfGrid grid) {
  double total = 0;
  for (int i = 0; i < grid.rows.count; i++) {
    final String value =
        grid.rows[i].cells[grid.columns.count - 1].value as String;
    total += double.parse(value);
  }
  return total;
}
