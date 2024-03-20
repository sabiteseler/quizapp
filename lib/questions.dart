import 'package:flutter/material.dart';
import 'package:intro/data/question_data.dart';
import 'package:intro/result_page.dart';
import 'package:intro/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

// AppBar
// Flutter'da sayfalar arası geçiş yöntemleri ve birbirlerine göre avantaj/dezavantajları ve kullanım oranları. (MEDIUM)
class _QuestionsScreenState extends State<QuestionsScreen> {
  // Dosyadan veri çek
  // Soruları tek tek ekranda göster.
  int currentQuestionIndex = 0; // O an kaçıncı soruda olduğumuz.
  bool resultPage = false;
  int correct = 0;
  int wrong = 0;
  void answer(givenAnswer, correctAnswer) {
    // Cevap verildiğinde verilen cevapları hafızada tut.
    // Sonuç ekranını tasarlayınız.
    setState(() {
      if (currentQuestionIndex < questions.length - 1)
        currentQuestionIndex++;
      else
        resultPage = true;
    });
    setState(() {
      if (givenAnswer == correctAnswer)
        correct++;
      else
        wrong++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(currentQuestion.question),
              // Soruların cevap sayısı 3 ile 6 arasında değişebilir, cevap butonlarını dinamik bir şekilde gelecek
              // şekilde kodlayınız..
              ListView.builder(
                itemCount: currentQuestion.answers.length,
                shrinkWrap: true, // listviewi sığdırıyor.
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AnswerButton(
                          answerText: currentQuestion.answers[index],
                          onClick: () {
                            answer(currentQuestion.answers[index],
                                currentQuestion.correctAnswer);
                            print("doğru $correct");
                            print(wrong);
                            if (resultPage)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    correct: correct,
                                    wrong: wrong,
                                  ),
                                ),
                              );
                          }),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Snippet