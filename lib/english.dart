import 'package:flutter/material.dart';

class English extends StatelessWidget {
  const English({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("English Language & Comprehension for SSC CGL"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Image.asset('assets/images/elcimage.png', height: 70),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'English Language & Comprehension for SSC CGL',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Spotting the Error
          const Text(
            "Parts of Speech",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'The parts of speech are the "traditional grammatical categories to which words are assigned in accordance with their syntactic \n'
            'functions, such as noun, verb, adjective, adverb, and so on."\n'
            'In other words, they refer to the different roles that words can play in a sentence and how \n'
            'they relate to one another based on grammar and syntax. \n'
            'All Parts of Speech with Examples: '
            'There are 8 different types of parts of speech i.e., Nouns, Pronouns, Adjectives, Verbs, Adverb, \n'
            'prepositions, Conjunction, and Interjection. \n'
            '1. Noun: \n'
            'A noun is a word that names a person, place, thing, state, or quality. \n'
            'It can be singular or plural. Nouns are a part of speech. \n'
            '• Function: Refers to Things or person. \n'
            '• Examples: Pen, Chair, Ram, Honesty. \n'
            '• Sentences: Cars are expensive, This chair is made of wood, and Ram is a topper, Honesty is the best policy. \n'
            '2. Pronoun: \n'
            'The word used in place of a noun or a noun phrase is known as a pronoun. \n'
            'A pronoun is used in place of a noun to avoid the repetition of the noun. \n'
            '• Function: Replaces a noun. \n'
            '• Examples: I, you, he, she, it, they. \n'
            '• Sentences: They are expensive, It is of wood, He is a topper, It is the best policy. \n'
            '3. Adjective: \n'
            'A word that modifies a noun or a pronoun is an adjective. \n'
            'Generally, an adjective’s function is to further define and quantify a noun or pronoun. \n'
            '• Function: Describes a noun. \n'
            '• Examples: Super, Red, Our, Big, Great, class. \n'
            '• Sentences: Supercars are expensive, The red chair is for kids, Ram is a class topper, and Great things take time. \n'
            '4. Verb: \n'
            'A word or a group of words that describes an action, a state, or an event is called a verb. \n'
            'A verb is a word that says what happens to somebody or what somebody or something does. \n'
            '• Function: Describes action or state. \n'
            '• Examples: Pen, Chair, Ram, Honesty. \n'
            '• Sentences: I play football, I will be a doctor, I like to work, I love writing poems. \n'
            '5. Adverb: \n'
            'A verb, adjective, another adverb, determiner, clause, preposition, or sentence is typically modified by an adverb. \n'
            'Adverbs often answer questions like “how,” “in what way,” “when,” “where,” and “to what extent” by \n'
            'expressing things like method, place, time, frequency, degree, level of certainty, etc. \n'
            '• Function: Describes a verb, adjective, or adverb. \n'
            '• Examples: Silently, too, very. \n'
            '• Sentences: I love reading silently, It is too tough to handle, He can speak very fast. \n'
            '6. Preposition: \n'
            'A preposition is called a connector or linking word which has a very close relationship with the noun, pronoun or adjective that follows it. \n'
            'Prepositions show position in space, movement, direction, etc. \n'
            '• Function: Links a noun to another word. \n'
            '• Examples: at, in, of, after, under. \n'
            '• Sentences: The ball is under the table, I am at a restaurant, she is in trouble, I am going after her, It is so nice of him. \n'
            '7. Conjunction: \n'
            'A conjunction is a word that connects clauses, sentences, or other words. \n'
            'Conjunctions can be used alone or in groups of two. \n'
            '• Function: Joins clauses and sentences. \n'
            '• Examples: and, but, though, after. \n'
            '• Sentences: First, I will go to college and then I may go to Fest, \n'
            'I don\'t have a car but I know how to drive, She failed the exam though she worked hard, \n'
            'He will come after he finishes his match. \n'
            '8. Interjection: \n'
            'An interjection is a word or phrase expressing some sudden feelings of sadness or emotions. \n'
            '• Function: Shows exclamation. \n'
            '• Examples: oh! wow!, alas! Hurray! \n'
            '• Sentences: Oh! I got fail again, Wow! I got the job, Alas! She is no more, Hurray! We are going to a party. \n',
          ),

          const SizedBox(height: 16),

          // Fill in the Blanks
          const Text(
            "Tense",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'Tense is defined as any of the forms of a verb that may be used to show the time of the action or state expressed by the verb. \n'
            'Types of Tenses: \n'
            'There are three tenses: \n'
            '• Present tense \n'
            '• Past tense \n'
            '• Future tense \n'
            'Further, all three tenses have four kinds: \n'
            '• Simple \n'
            '• Continuous \n'
            '• Perfect \n'
            '• Perfect Continuous \n'
            'Tenses And Their Usage: \n'
            'There are three primary verb tenses: past, present, and future. \n'
            'Each tense is further divided into simple, continuous (also known as progressive), perfect, and perfect continuous tenses. \n'
            'Let/s explore each type in detail: \n'
            'Present Tense: \n'
            'Present Indefinite or Simple Present- \n'
            'Structure: \n'
            'Subject (I, You, We, They ) + V1 ( First Form of Verb ) + Object. \n'
            'Example: \n'
            '• I go to school. \n'
            'Present Continuous Tense: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + auxiliary verb (is/am/are) + Verb+ing + Object. \n'
            'Example: \n'
            '• I am going to school. \n'
            '• He is playing football. \n'
            '• They are reading books. \n'
            'Present Perfect Tense: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + has/have + V3 (third form of verb) + Object. \n'
            'Example: \n'
            '• He has played football. \n'
            '• They have read books. \n'
            'Present Perfect Continuous Tense: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + has/have + been + Verb(ing) + Object. \n'
            'Example: \n'
            '• He has been playing football. \n'
            '• They have been reading books. \n'
            'Past Tense: \n'
            'We use the past tense to describe an action that has happened the time before the present. \n'
            'This tense has four aspects that talk about to what extent action has been completed. \n'
            'Simple Past: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + V2 (second form of verb) + Object. \n'
            'Example: \n'
            '• I went to school. \n'
            '• He played football. \n'
            '• They read books. \n'
            'Past Continuous Tense: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + was/were + Verb+ing + Object. \n'
            'Example:  \n'
            'I was going to school. \n'
            '• He was playing football. \n'
            '• They were reading books. \n'
            'Past Perfect Tense: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + had + V3 (third form of verb) + Object. \n'
            'Example: \n'
            '• He had played football. \n'
            '• They had read books. \n'
            'Past Perfect Continuous Tense: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + had been + Verb(ing) + Object. \n'
            'Example: \n'
            '• He had been playing football. \n'
            '• They had been reading books. \n'
            'Future Tense: \n'
            'We use the future tense to talk about actions that will happen after the present time. \n'
            'Simple Future: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + will/shall + V1 (first form of verb) + Object. \n'
            'Example: \n'
            '• He will play football. \n'
            '• They will read books. \n'
            'Future Continuous Tense: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + will be/shall be + Verb(ing) + Object. \n'
            'Example: \n'
            '• He will be playing football. \n'
            '• They will be reading books. \n'
            'Future Perfect Tense: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + will have/shall have + V3 (third form of verb) + Object. \n'
            'Example: \n'
            '• He will have played football. \n'
            '• They will have read books. \n'
            'Future Perfect Continuous Tense: \n'
            'Structure: \n'
            'Subject ( I/ You/ We/ They ) + will have been/shall have been + Verb(ing) + Object. \n'
            'Example: \n'
            '• He will have been playing football. \n'
            '• They will have been reading books. \n'
            '• They were reading books. \n',
          ),

          const SizedBox(height: 16),

          // Synonyms and Antonyms
          const Text(
            "Synonyms and Antonyms",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'Synonyms: \n'
            'Synonyms are words or phrases that have the same or nearly same meaning as another word or phrase. \n'
            'It can be used in a sentence to avoid repetition, without losing the actual meaning of it. \n'
            'Synonym examples: \n'
            '• Abate: Moderate. \n'
            '• Ascend: Escalate. \n'
            '• Cunning: Smart. \n'
            '• Dwarf: Petite. \n'
            'Antonyms: \n'
            '• Antonyms are the words/phrases that have opposite meanings as another word or phrase. \n'
            '• Antonyms examples: \n'
            '• Abate: Aggravate. \n'
            '• Ascend: Descend, Decline. \n'
            '• Cunning: Naive. \n'
            '• Dwarf: Huge. \n',
          ),

          const SizedBox(height: 16),

          // One Word Substitution
          const Text(
            "One Word Substitution",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'One Word Substitution is an essential topic of verbal ability. As the name suggests, questions based on  \n'
            'this concept ask you to replace a given sentence with an appropriate word. \n'
            'A One-Word Substitute. It is an essential tool in the English language for avoiding wordiness and  \n'
            'making speech or writing more effective and elegant. \n'
            'One-Word Substitution Examples: \n'
            'Let/s understand One Word Substitution with a few examples as below- \n'
            'He is a person who believes that pleasure is the highest good: He is a hedonist. \n'
            'My friend cannot tolerate confined spaces: My friend suffers from claustrophobia. \n'
            'She is skilled in more than one language: She is a polyglot. \n'
            'The old man has lost his ability to remember things: The old man is suffering from amnesia. \n'
            'He is someone who gives up worldly pleasures and lives a simple life: He is an ascetic. \n',
          ),

          const SizedBox(height: 16),

          // Idioms & Phrases
          const Text(
            "Idioms & Phrases",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'Idioms: \n'
            'Idioms are the combination of words that convey a separate meaning altogether. \n'
            'Idioms are expressions or ways of speaking that is used in the common vocabulary. \n'
            'For example, If you say you “Smell a rat” you don\t literally mean that you are smelling a rat. \n'
            'Smell a rat” is an idiom that means “to sense that someone has caused something wrong. \n'
            'Examples: \n'
            'Let/s understand Idioms with a few examples as below- \n'
            '1. Be hand and foot means to complete any task In all possible ways or by all means. \n'
            '2. Be in the swim means To keep oneself informed and up-to-date. \n'
            '3. Can’t cut the mustard means Someone who is not adequate enough to compete or participate. \n'
            '4. Beat around the bush means Trying to avoid a subject/person/situation. \n'
            '5. Kill two birds with one stone means Accomplish two things with the same effort. \n'
            '6. Beating a Dead Horse means Giving time or energy to something that is ended or over. \n'
            '7. Costs an Arm and a Leg means Something that is overpriced or very expensive. \n'
            '8. Variety is the spice of life means New and exciting experiences make life more interesting. \n'
            '9. Wag the dog means to change the topic from something that is more important to something that is not. \n'
            '10. Thumb one/s nose means a gesture of disrespect. \n'
            'Phrases Definition: \n'
            'Phrases could be defined as a collection of words that stands together as a single unit in a sentence,typically as part of a clause or a sentence. \n'
            'Phrases are just a unit of a sentence, hence they do not express a complete statement. \n'
            'In English Grammar, there are different types of Phrases namely Noun, verb, infinitive, gerund, appositive, participial, prepositional, and absolute Phrases. \n'
            'Examples: \n'
            'Let/s understand Phrases with a few examples as below- \n'
            '1. The glass of water was on the shelf. \n'
            '2. The employees were giggling and laughing when the manager left the room. \n'
            '3. The nice neighbour offered him a glass of juice. \n'
            "4. There's a chemist around the corner. \n"
            '5. My English teacher teaches the English language proficiently.  \n'
            '6. It has been raining heavily for the last few days. \n',
          ),

          const SizedBox(height: 16),

          // Reading Comprehension
          const Text(
            "Phrasal Verbs",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCard(
            'The English Language abounds in the use of verbs with prepositions or adverbs to obtain a variety of meanings. \n'
            'The verbs used with prepositions, adverbs, or both are defined as phrasal verbs and they denote idiomatic meaning only when taken as a whole. \n'
            'These prepositions and adverbs are known in grammar as Particles. \n'
            'In simpler words we can say that - phrasal verbs are combined with prepositions or adverbs, changing their meaning. \n'
            'For example, “look” means to see, but "Look After" means to care for. \n'
            'They are common in English and often have meanings different from the individual words used. \n'
            'Types of Phrasal Verbs: \n'
            'There are two types of expressions of phrasal verbs. \n'
            '1. Transitive Phrasal Verbs. \n'
            '2. Intransitive Phrasal Verbs. \n'
            'Transitive  Phrasal Verbs: \n'
            'Transitive verbs are action words that need an object to complete their meaning. \n'
            'For example, in “She reads books,” “reads” is transitive, and “books” is the object. \n'
            'Transitive phrasal verbs use a direct object, just like normal transitive verbs. They can be used as- \n'
            '1. Nouns (as direct objects)are usually placed at the end of transitive expressions or immediately after the verb and before the particle. \n'
            'She took off her apron. \n'
            'She took her apron off. \n'
            '2. Pronounobjects are more often used after the verb or before the short words ‘off, on, up, down, in, out, away,’ etc. \n'
            'I went to see him off. \n'
            'She brought him up. \n'
            '3. Pronoun objects are placed at the end of such expressions when verbs cannot be split such as ‘look for, account for, call at, call on, look after, etc. \n'
            'I am looking for him. \n'
            'You should look after her. \n'
            'I called on him yesterday. \n'
            'You have to stand by me. \n'
            'Intransitive  Phrasal Verbs: \n'
            'Intransitive  Phrasal Verbs do not use any object. For example-  \n'
            'She broke down in court. \n'
            'His father came around at last. \n'
            'Their marriage comes off next month. \n'
            'The meeting broke up suddenly. \n',
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Reusable card builder for each theory block
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
