import 'package:flutter/material.dart';
import 'package:moviebooker/core/colors.dart';
import 'package:moviebooker/presentation/widgets/seat_available_grid.dart';
import 'package:moviebooker/utils/date_formatter.dart';

class SelectSeatScreen extends StatefulWidget {
  final int hallIndex;
  final String hallName, movieName, date, time;
  final List<List<int>> seatLayout;

  const SelectSeatScreen({
    Key? key,
    required this.hallIndex,
    required this.hallName,
    required this.movieName,
    required this.date,
    required this.time,
    required this.seatLayout,
  }) : super(key: key);

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  Set<String> selectedSeats = {};
  int totalPrice = 0;

  void _updateSelectedSeats(Set<String> seats, int price) {
    setState(() {
      selectedSeats = seats;
      totalPrice = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text(
              widget.movieName,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '${formatDate(widget.date)} | ${widget.time} ${widget.hallName}',
              style: TextStyle(
                color: AppColors.lightBlue,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          SeatAvailableGrid(
            seatLayout: widget.seatLayout,
            fromSelectSeat: true,
            onSeatSelectionChanged: _updateSelectedSeats,
          ),
          Expanded(child: _buildBottomBar()),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Seat Type Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _legendItem(AppColors.gold, "Selected"),
              _legendItem(Colors.grey, "Not available"),
              SizedBox(),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _legendItem(AppColors.darkPurple, "VIP (150\$)"),
              _legendItem(AppColors.lightBlue, "Regular (50 \$)"),
              SizedBox(),
            ],
          ),

          // Display Selected Seats Separately
          if (selectedSeats.isNotEmpty)
            Wrap(
              spacing: 8,
              children:
                  selectedSeats.map((seat) {
                    return Chip(
                      label: Text(seat),
                      side: BorderSide(color: Colors.transparent),
                     
                      backgroundColor: AppColors.lightPurple,
                    );
                  }).toList(),
            ),

          Spacer(),
          // Total Price & Proceed Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    "\$ $totalPrice",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: selectedSeats.isNotEmpty ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightBlue,
                  disabledBackgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Proceed to Pay",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
