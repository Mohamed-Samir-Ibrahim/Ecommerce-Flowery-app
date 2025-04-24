import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(children: [Image.asset("assets/icon/flower.png"),
              SizedBox(width: 4.w),
              Text("Flowery", style: TextStyle(color: ColorManager.primary)),
              SizedBox(width: 17.w),],),
    ),
    body:SingleChildScrollView(padding: EdgeInsets.all(20.w),
    child: Card(
      child: Text('''

    🌸 About Us – Flowery
    
    Welcome to Flowery, your go-to destination for elegant floral arrangements, 
  thoughtful gifts, and a seamless shopping experience.
    
    At Flowery, we believe that every flower tells a story. Whether you're celebrating 
  love, friendship, gratitude, or simply want to brighten someone’s day, our
  handpicked blooms are designed to leave a lasting impression.
    
    💐 Who We Are:
    Flowery is a modern e-commerce platform specializing in flowers, gifts, and
  special  occasion items. We combine creativity, convenience, and care to ensure
  your orders are  delivered fresh, fast, and flawlessly.
    
    🚚 What We Offer:
    - A wide variety of fresh flowers for every occasion  
    - Customizable gift packages and greeting options  
    - Same-day delivery in selected areas  
    - Easy and secure online ordering  
    
    ❤️ Our Mission:
     To spread joy and beauty, one flower at a time.
    
    📍 Why Choose Us?
    - Premium quality flowers sourced from trusted growers  
    - Artistic floral designs by passionate florists  
    - Excellent customer support  
    - Affordable pricing with seasonal offers  
    
    Thank you for choosing Flowery — where every petal speaks from the heart. 🌷
    ''',
      style: TextStyle(fontSize: 16, height: 1.5),
      textAlign: TextAlign.start,
        ),
    ),),
    );
    
  }
}