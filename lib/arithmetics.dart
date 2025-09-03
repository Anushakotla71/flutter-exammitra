import 'package:flutter/material.dart';

class Arithmetics extends StatelessWidget {
  const Arithmetics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arithmetics for SSC CGL"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Image.asset('assets/images/arithmeticimage.webp', height: 70),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Arithmetics for SSC CGL',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Percentage
          const Text(
            "Percentage",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'A fraction whose denominator is 100 is called a Percent. \n'
            'In all the fractions where the denominator is 100, we can remove the denominator and put the % sign.\n'
            'The word "Percentage" was coined from the Latin word "Percentum" which means "by hundred". \n'
            'It is a dimensionless relation between two numbers. It is often denoted by the sign "%" or percent or pct. \n'
            'percentage Formula: \n'
            'It is a formula that is used to find the amount or share of a quantity in terms of a hundred. \n'
            'So, for calculating the percentage, we need three variables. First, the total value V1, the present value V2, and the percentage value P. \n'
            'The algebraic equation for this will be: \n'
            'Percentage (P%) = (Parts (V2) / Whole (V1)) × 100'
            'Example: \n'
            'Percent of a Number = Percentage/100 × Number. \n'
            'Calculate 5% of 50 \n'
            '1. 5% of 50 = 5/100 × 50 \n'
            '2. 5% of 50 = 0.05 × 50 \n'
            '3. 5% of 50 = 2.50 \n'
            'Percentage Difference Formula:  \n'
            'The Percentage difference or the percentage change formula is calculated when the difference between \n'
            'two values is divided by the average of the same values. We can say that the percentage difference \n'
            'is used to calculate the change in the value over the given period. Mathematically, we can be written as,  \n'
            'Percentage Difference = (Absolute difference / Average) × 100 \n'
            '''Example: 
                  The Percentage difference between 50 and 100 will be:

                    = |50−100| / ((50+100)/2) × 100
                    = 50/75 × 100
                    = 66.66%''',
          ),

          const SizedBox(height: 16),

          // Ratio & Proportion
          const Text(
            "Ratio & Proportion",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'Ratio and Proportion are used for comparison in mathematics. Ratio is a comparison of two quantities \n'
            'while Proportion is a comparison of two ratios. \n'
            'When a fraction a/b is written a:b then it is termed as a ratio b. \n'
            'When two ratios let\'s say a:b and c:d are equal a:b and c:d are said to be proportional to each other. \n'
            'Two proportional ratios are written as a:b::c:d. \n'
            'Ratio: \n'
            'Ratio is a comparison of two quantities of the same unit. The ratio of two quantities is given by using \n'
            'the colon symbol (:). The ratio of two quantities a and b is given as : \n'
            'a : b'
            'where'
            'a is called Antecedent. \n'
            'b is called Consequent. \n'
            'The ratio a:b means ak/bk where k is the common factor. k is multiplied to give equivalent fractions \n'
            "whose simplest form will be a/b. We can read a:b as 'a ratio b' or 'a to b'. \n"
            'Ratio Properties: \n'
            'If a ratio is multiplied by the same term both in antecedent and consequent then there is no change in the actual ratio. \n'
            'Example, A : B = nA : nB \n'
            'If the antecedent and consequent of a ratio are divided by the same number then also there is no change in the actual ratio. \n'
            'Example, A : B = A/n : B/n \n'
            'If two ratios are equal then their reciprocals are also equal. \n'
            'Example: If A : B = C : D then B : A = D : C \n'
            'If two ratios are equal then their cross-multiplications are also equal. \n'
            'Example: A : B = C : D then A × D = B × C. \n'
            'The ratios for a pair of comparisons can be the same but the actual value may be different. \n'
            'Example 50:60 = 5:6 and 100:120 = 5:6 hence ratio 5:6 is the same but the actual value is different. \n'
            'Proportion: \n'
            'Proportion refers to the comparison of ratios. If two ratios are equal then they are said to be \n'
            'proportionate to each other. Two proportional ratios are represented by a double colon(::). \n'
            'If two ratios a:b and c:d are equal then they are represented as  \n'
            'a : b :: c : d'
            'where  \n'
            'a and d are called extreme terms. \n'
            'b and c are called mean terms. \n'
            'Proportion Properties: \n'
            'For two ratios in proportion i.e. A/B = C/D, A/C = B/D holds true. \n'
            'For two ratios in proportion i.e. A/B = C/D, B/A = D/C holds true. \n'
            'For two ratios in proportion i.e. A : B :: C : D, the product of mean terms is equal to the product of extreme terms i.e. AD = BC \n'
            'For two ratios in proportion i.e. A/B = C/D, (A + B)/B = (C + D)/D is true. \n'
            'For two ratios in proportion i.e. A/B = C/D, (A - B)/B = (C - D)/D is true. \n'
            'Types of Proportions: \n'
            'There are three types of Proportions: \n'
            'Direct Proportion : When two quantities increase and decrease in the same ratio then the two quantities \n'
            'are said to be in Direct Proportion. It means if one quantity increases/decreases then the other will also increase/decrease. \n'
            'It is represented as a ∝ b. \n'
            'Example: \n'
            'if the speed of vehicle increases then the distance travelled will also increase. ( provided time is same in both scenarios ) ....  \n'
            'Inverse Proportion: \n'
            'When two quantities are inversely related to each other i.e. increase in one leads to \n'
            'a decrease in the other or a decrease in the other leads to an increase in the first quantity then the two \n'
            'quantities are said to be Inversely Proportional to each other. \n'
            'Example: \n'
            'if the speed of vehicle increases then the time taken to travel the same distance travelled will decrease. \n'
            'Continued Proportion: \n'
            'If the ratio a:b = b:c = c:d, then we see that the consequent of the first ratio is \n'
            'equal to the antecedent of the second ratio, and so on then the a:b:c:d is said to be in continued proportion. \n'
            'If the consequent and antecedent are not the same for two ratios then they can be converted into \n'
            'continued proportion by multiplying. \n'
            'Example: \n'
            'In the case of a:b and c:d consequent and antecedent are not same then the continued proportion is given as ac:cb:bd.  \n'
            'In the continued proportion a:b:c:d., c is called the third proportion, and d is called the fourth proportion. \n',
          ),

          const SizedBox(height: 16),

          // Average
          const Text(
            "Average",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'An average is a single number expressing a set of data. It is calculated by dividing the sum of the values \n'
            'in the set by their number, also called the arithmetic mean. The basic formula for the average of n \n'
            'numbers x1, x2,......xn is \n'
            '(Average) = (x1 + x2 +........ + xn)/n.'
            'it is denoted x̄ (read as "x bar"). We also use the Greek letter "μ" to denote the average. \n'
            'Average Formula: \n'
            'The average in mathematics is calculated using the formula sum of values divided by the number of values.\n'
            'Hence, the average formula is given as \n'
            'Average = Sum of Values/Number of Values \n'
            'For given n numbers x1, x2, x3 ,….., xn the average is given by the formula, \n'
            'Average = (x1+ x2 + ... + xn)/n'
            'How to Calculate Average: \n'
            'Study the following steps to find the average of various numbers \n'
            'Step 1: Note all the observations and find the total number of observations (say n) \n'
            'Step 2: Find the sum of all observations. \n'
            'Step 3: Divide the sum obtained in Step 2 by the number of observations (n) \n'
            'Step 4: Simplify to obtain the required value of the Average. \n'
            'Example: Find the average of 3, 4, 7, 8, 10, and 12. \n'
            'Solution: \n'
            'Given values, \n'
            '3, 4, 7, 8, 10, 12 \n'
            'Number of Observations = 6 \n'
            'Sum of Observations = 3 + 4 + 7 + 8 + 10 + 12 = 34 \n'
            'Average = 34/6 = 5.67 \n'
            'Mean: \n'
            'Mean in mathematics is the measure of central tendency. It is also called the average or arithmetic mean. \n'
            'It is calculated by dividing the sum of values by the total number of values. \n',
          ),

          const SizedBox(height: 16),

          // Time & Work
          const Text(
            "Time & Work",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'Time and Work: \n'
            'Time and work is a concept in mathematics that deals with the relationship between the amount of work done, \n'
            'the time taken to complete the work, and the rate at which the work is performed.\n'
            'It is commonly encountered in various real-life scenarios such as production processes, construction projects, and task management. \n'
            'Relationship between Time and Work: \n'
            'The relationship between time and work can be understood through the concept of work rate. \n'
            'Work rate refers to the speed at which work is completed, usually measured in \n'
            'units of work done per unit of time (e.g., tasks per hour, widgets produced per day).\n'
            'The fundamental relationship between time and work is expressed by the formula: \n'
            'Work = Work Rate × Time \n'
            'Applications of Time and Work: \n'
            'Project Management: \n'
            'In project management planning the exact minutes and hours to define the project timeline, \n'
            'resources to be allocated and tasks to go chronologically is what is very crucial. \n'
            'The managers of the projects apply CMP (Critical Path Method) and PERT (Program Evaluation and Review Technique) methods \n'
            'to obtain project durations, in which they redefine the timeline of each task as well as the resources assigned for it. \n'
            'Manufacturing and Production: \n'
            'Time and work concepts are generally adopted in most production and manufacturing processes to maximize both efficiency and output.\n'
            'Determining the production rate, setting good working schedules, and arranging maintenance needs are all built on forecasting \n'
            'the task timing and the workforce at hand. \n'
            'Daily Task Management: \n'
            'We do that all the time! You probably apply time and work principles to accomplish \n'
            'tasks at your work or better your organization/s productivity. For instance, \n'
            'whether it is about organizing the housework timetable, creating the work schedule, or handling \n'
            'the office assignments, planning the time needed is the right way to accomplish a schedule effectively. \n'
            'Resource Planning: \n'
            'Companies research on number of man-hours or work times to allocate the resources well, \n'
            'schedule employees, or use equipment and control inventories well. By analyzing how much time it takes to \n'
            'achieve the different objectives and also the availability of the resources, organizations can plan for \n'
            'the operations and make their costs lower. \n'
            'Sports and Fitness: \n'
            'As in the case of sports on work and leisure hours and in sports and fitness a lot of time and effort are also needed.\n'
            'Sportsmen and coaches employ a training regimen that is based on a work-to-rest ratio to \n'
            'boost the athlete’s performance and prevent the phenomena of burnout. \n'
            'Similar to that, fitness-minded people make up plans based on the time inside the workout which are required to \n'
            'achieve certain goals.\n'
            'Real-Life Applications with Examples: \n'
            'Some of the real-life situations where the concept of time and work can be emplyed are: \n'
            'Project Deadline Estimation \n'
            'Production Line Optimization \n'
            'Household Chores Planning \n'
            'Fitness Training \n'
            'Resource Allocation in a Restaurant \n'
            'Project Deadline Estimation: \n'
            'When a development team of software application estimates how much time they need for a module of a project,\n'
            'they use time and work principles to schedule use of resources and meet deadlines accordingly. \n'
            'Example: \n'
            'let us say Module A takes 50 hours and module B takes 30 hours of work. This can help the team in planning the schedule. \n'
            'Production Line Optimization: \n'
            'In a factory setting, managers flow the clock and work to balance the production line. \n'
            'Example: \n'
            'Considering that the machine can make 100 units per hour, the manager knows i advance that \n'
            'the required number of 1000 units will be produced within 10 hours. Therefore, appropriate resources \n'
            'need to be allocated, as the output levels can be determined in advance. \n'
            'Household Chores Planning: \n'
            'A managing a house regularly makes a timetable to complete different jobs like food preparation, \n'
            'washing, and shopping according to estimated time for each task. \n'
            'Example: \n'
            'if a preparation of dinner takes one hour and cleaning of house takes another 2 hours, they will \n'
            'schedule their day in such a way that they get all the works done in time. \n'
            'Fitness Training: \n'
            'An exercise instructor writes out a client\'s workout program to match the theory of time and work. \n'
            'Example: \n'
            'if a client wants to develop a better cardiovascular endurance, the trainer may incorporate in \n'
            'the training programs interval training that will have intervals with specific work-to-rest ratios, \n'
            'such as 1 min of intense workout followed by 2 min of rest, for optimal results. \n'
            'Resource Allocation in a Restaurant: \n'
            'The restaurant manager aids in determining work and time schedules that can be used to distribute shifts to \n'
            'workers and maintain stocks and collection. \n'
            'Example: \n'
            'What they must accomplish is to set the time needed for food preparation, serving customers, and \n'
            'putting their supplies in order, so that they have a system of operations which is perfect. \n'
            'Conclusion: \n'
            'In Conclsuion, time and work is a mathematical concept that finds applications in various real-life scenarios, \n'
            'guiding us in managing tasks and resources effectively. From managing our daily schedules to \n'
            'overseeing large-scale projects, these concepts shape the way we approach tasks and allocate resources. \n'
            'By understanding how time and work relate to each other, we can make informed decisions that optimize efficiency and productivity. \n'
            "Example: If A completes work in 10 days, then A's 1 day work = 1/10.\n"
            "If A and B together finish a work in 6 days and A alone does it in 10 days, then B alone can do it in: 1/6 - 1/10 = 1/15 ⇒ 15 days.",
          ),

          const SizedBox(height: 16),

          // Profit, Loss & Discount
          const Text(
            "Profit, Loss & Discount",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'Profit and Loss: \n'
            'Profit is the positive difference between the selling price and the cost price of an item, \n'
            'indicating a gain or financial benefit. It is calculated by subtracting the cost price from the selling price. \n'
            'Conversely, loss occurs when the selling price is less than the cost price, resulting in a negative difference. \n'
            'The formula for calculating profit is SP - CP, while the formula for calculating loss is CP - SP. \n'
            "This article explores all the concepts related to Profit and Loss, whether it's their formula or their percentage formula. \n"
            'Here we will also learn about the marked-up price and discount. \n'
            'Concepts of Profit and Loss: \n'
            'In Profit and Loss, the most basic concepts are the prices of various items throughout the cycle of their purchase and sale. \n'
            'These prices are Cost Price, Selling Price, and Marked Price which are abbreviated as C.P., S.P., and M.P., respectively. \n'
            'Cost Price (CP): \n'
            'Cost price (CP) of a product is the amount paid for it. In some cases, it also covers overhead costs, transportation costs, etc. \n'
            'Example: \n'
            'You bought a refrigerator at Rs 20,000 and spent Rs 4000 for transportation and Rs 1000 for set up. \n'
            'So the total cost price is the sum of all the expenditures done which will be Rs 25000. \n'
            'Cost Price Formula: \n'
            'Formula for cost price is given as: \n'
            'Cost Price = Selling Price - Profit \n'
            'Cost Price = Selling Price + Loss \n'
            'Selling Price (SP): \n'
            'The selling price (SP) of a product is the amount at which it is sold. It might be greater, equal to, or less \n'
            'than the product/s cost price. \n'
            'Example: \n'
            'If a shopkeeper bought a chair at Rs 1500 and sold it at Rs 1900, then the cost price \n'
            'of the chair is Rs 1500 and the selling price of the chair is Rs 1900. \n'
            'Selling Price Formula: \n'
            'Formula for selling price is given as: \n'
            'Selling Price = Cost Price + Profit \n'
            'Selling Price = Cost Price - Loss \n'
            'Discount: \n'
            'When the item is sold at a price which is less then the marked price, then we say item is sold at discount \n'
            'and it can be calculated using the formula, \n'
            'Discount  = M.P. - S.P. \n'
            'Where \n'
            'M.P. is the marked price of the goods, and \n'
            'S.P. is the selling price of the goods. \n',
          ),

          const SizedBox(height: 16),

          // Partnership
          const Text(
            "Partnership",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'Partnership: \n'
            'A partnership is a business form in which two or more people share ownership, management, and the company\'s income or losses. \n'
            'Partners may contribute capital, labour, skills, and experience to the business. \n'
            'They may have unlimited legal liability for the partnership’s and its partners’ actions. \n'
            'A partnership splits its profit or loss among its partners. They are responsible for filing and \n'
            'paying taxes for their portion of the partnership profit. \n'
            "Example: A invests ₹1000 for 12 months, B invests ₹1500 for 8 months,\n"
            "Then ratio = (1000×12):(1500×8) = 12000:12000 = 1:1 → Equal Profit.",
          ),
        ],
      ),
    );
  }

  static Widget _buildCard(String content) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(content, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
