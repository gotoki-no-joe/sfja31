(* * Preface *)
(** * 前書き *)

(* ###################################################################### *)
(* * Welcome *)
(** * ようこそ *)

(*  This electronic book is a course on _Software Foundations_, the
    mathematical underpinnings of reliable software.  Topics include
    basic concepts of logic, computer-assisted theorem proving and the
    Coq proof assistant, functional programming, operational
    semantics, Hoare logic, and static type systems.  The exposition
    is intended for a broad range of readers, from advanced
    undergraduates to PhD students and researchers.  No specific
    background in logic or programming languages is assumed, though a
    degree of mathematical maturity will be helpful.

    One novelty of the course is that it is one hundred per cent
    formalized and machine-checked: the entire text is literally a
    script for Coq.  It is intended to be read alongside an
    interactive session with Coq.  All the details in the text are
    fully formalized in Coq, and the exercises are designed to be
    worked using Coq.

    The files are organized into a sequence of core chapters, covering
    about one semester's worth of material and organized into a
    coherent linear narrative, plus a number of "appendices" covering
    additional topics.  All the core chapters are suitable for both
    graduate and upper-level undergraduate students. *)
(** この電子文章は「ソフトウェアの基礎（プログラミングとプログラミング言語の数学的理論）」という、大学後半〜院生向けの1学期分の講義のために書かれたものです。この講義では、Coq上で関数プログラミング、論理学、操作的意味論、Hoare論理、静的型システムの基礎を学ぶことができます。論理学やプログラミング言語に関する特定の予備知識は必要ありませんが、ある程度数学に通じていると理解の助けとなるでしょう。

このコースの重要な特徴は、教材のテキストがCoqのスクリプトファイルそのものとなっており、学習の進み具合を「形式的」かつ「機械的」に確認しながら学んでいくことができる、ということです。このコースでは、Coqの対話モードを使って、ソースを1行1行追いながら動きを理解していきます。講義のほとんどはCoqで組み立てられ、Coq上で作業し演習するようデザインされています。

このファイルは章立てされ整理されており、1学期ぶんの教材として十分で、順番に学習していけるよう、筋道立てて作成されています。さらに加えて、いくつかのトピックについて追加項目があります。 *)
(* JOE 意訳が多い。*)


(* ###################################################################### *)
(* * Overview *)
(** * 概要 *)

(*  Building reliable software is hard.  The scale and complexity of
    modern software systems, the number of people involved in building
    them, and the range of demands placed on them make it extremely
    difficult to build software that works as intended, even most of
    the time.  At the same time, the increasing degree to which
    software is woven into almost every aspect of our society
    continually amplifies the cost of bugs and insecurities.

    Computer science and software engineering have responded to these
    challenges by developing a whole host of techniques for improving
    software reliability, ranging from recommendations about managing
    software projects and structuring programming teams (e.g., extreme
    programming) to design philosophies for libraries (e.g.,
    model-view-controller, publish-subscribe, etc.) and programming
    languages (e.g., object-oriented programming, aspect-oriented
    programming, functional programming), to mathematical techniques
    for specifying and reasoning about properties of software and
    tools for helping validate these properties.  

    The present course is focused on this last set of techniques.  The
    text weaves together five conceptual threads:

    (1) basic tools from _logic_ for making and justifying precise
        claims about programs;

    (2) the use of _proof assistants_ to construct rigorous logical
        arguments;

    (3) the idea of _functional programming_, both as a method of
        programming and as a bridge between programming and logic;

    (4) formal techniques for _reasoning about the properties of
        specific programs_ (e.g., that a loop terminates on all
        inputs, or that a sorting function actually fulfills its
        specification); and

    (5) the use of _type systems_ for establishing well-behavedness
        guarantees for _all_ programs in a given programming
        language (e.g., the fact that well-typed Java programs cannot
        be subverted at runtime).

    Each of these topics is easily rich enough to fill a whole course
    in its own right; taking all of them together naturally means that
    much will be left unsaid.  But we hope readers will agree that the
    themes illuminate and amplify each other in useful ways, and that
    bringing them together creates a foundation from which it will be
    easy to dig into any of them more deeply.  Some suggestions for
    supplemental texts can be found in the [Postscript] chapter. *)
(** 信頼できるソフトウェアの構築は困難です。意図通りに動作するソフトウェアの構築は難しいものですが、現代のソフトウェアシステムのスケールと複雑さ、その構築に関わる人数、それに課せられる要求の幅広さ、によりさらに困難さは極まっています。同時に、私たちの社会のあらゆる側面にソフトウェアが組み込まれてきて、バグとセキュリティのコストは増大しています。

コンピュータサイエンスとソフトウェア工学は、この問題に対応するためにソフトウェアの信頼性を向上させる数多くの技法を開発してきました。その範囲は、ソフトウェアプロジェクトの管理と開発チームの構成（例：エクストリームプログラミング）、ライブラリの設計哲学（例：MVC、publish-subscribeなど）、プログラミング言語（例：オブジェクト指向プログラミング、アスペクト指向プログラミング、関数型プログラミング）から、ソフトウェアの性質の仕様化と論証のための数学的技法とそれらの性質の検証を支援するツールまで多岐にわたります。

このコースはこの最後に挙げた技法に焦点をあてています。このテキストは次の5つの概念を綴り合わせたものです。

  (1) プログラムの要求を記述し正当性を確認するための_論理学_の基本的ツール

  (2) 厳格な論理的推論を構築するための_証明支援系_の利用

  (3) プログラミングの道具として、またプログラミングと論理の架け橋としての、_関数型プログラミング_の考え方

  (4) _特定のプログラムの性質を推論する_形式的技法（例えば、いかなる入力でもループが停止するか、整列を行うプログラムが実際にその仕様を満たすか）

  (5) 与えられたプログラミング言語の_あらゆる_プログラムのよい振る舞いを保証するための_型システム_の利用（例えば、型の正しいJavaプログラムは実行時に異常終了しないという事実）

これらの話題のそれぞれはそれ自身で1つのコースになる「濃い」ものです。それらを全てとりあげるということはつまり、言及できない事柄も多く残されるということです。But we hope readers will agree that the
    themes illuminate and amplify each other in useful ways, and that
    bringing them together creates a foundation from which it will be
    easy to dig into any of them more deeply.  Some suggestions for
    supplemental texts can be found in the [Postscript] chapter. *)
(* JOE *)

(* ** Logic *)
(** ** 論理学 *)

(** Logic is the field of study whose subject matter is _proofs_ --
    unassailable arguments for the truth of particular propositions.

    Volumes have been written about the central role of logic in
    computer science.  Manna and Waldinger called it "the calculus of
    computer science," while Halpern et al.'s paper _On the Unusual
    Effectiveness of Logic in Computer Science_ catalogs scores of
    ways in which logic offers critical tools and insights.  

   In particular, the fundamental notion of inductive proofs is
   ubiquitous in all of computer science.  You have surely seen them
   before, in contexts from discrete math to analysis of algorithms,
   but in this course we will examine them much more deeply than you
   have probably done so far. *)

(* ** Proof Assistants *)
(** ** 証明支援系 *)

(** The flow of ideas between logic and computer science has not gone
    only one way: CS has made its own contributions to logic.  One of
    these has been the development of tools for constructing proofs of
    logical propositions.  These tools fall into two broad categories:

       - _Automated theorem provers_ provide "push-button" operation:
         you give them a proposition and they return either _true_,
         _false_, or _ran out of time_.  Although their capabilities
         are limited to fairly specific sorts of reasoning, they have
         matured enough to be useful now in a huge variety of
         settings.  Examples of such tools include SAT solvers, SMT
         solvers, and model checkers.

       - _Proof assistants_ are hybrid tools that try to automate the
         more routine aspects of building proofs while depending on
         human guidance for more difficult aspects.  Widely used proof
         assistants include Isabelle, Agda, Twelf, ACL2, PVS, and Coq,
         among many others.

    This course is based around Coq, a proof assistant that has been
    under development since 1983 at a number of French research labs
    and universities.  Coq provides a rich environment for interactive
    development of machine-checked formal reasoning.  The kernel of
    the Coq system is a simple proof-checker which guarantees that
    only correct deduction steps are performed.  On top of this
    kernel, the Coq environment provides high-level facilities for
    proof development, including powerful tactics for constructing
    complex proofs semi-automatically, and a large library of common
    definitions and lemmas.
    
    Coq has been a critical enabler for a huge variety of work across
    computer science and mathematics.  

    - As a platform for the modeling of programming languages, it has
      become a standard tool for researchers who need to describe and
      reason about complex language definitions.  It has been used,
      for example, to check the security of the JavaCard platform,
      obtaining the highest level of common criteria certification,
      and for formal specifications of the x86 and LLVM instruction
      sets.

    - As an environment for the development of formally certified
      programs, Coq has been used to build CompCert, a fully-verified
      optimizing compiler for C, for proving the correctness of subtle
      algorithms involving floating point numbers, and as the basis
      for Certicrypt, an environment for reasoning about the security
      of cryptographic algorithms.

    - As a realistic environment for experiments with programming with
      dependent types, it has inspired numerous innovations.  For
      example, the Ynot project at Harvard embeds "relational Hoare
      reasoning" (an extension of the _Hoare Logic_ we will see later
      in this course) in Coq.

    - As a proof assistant for higher-order logic, it has been used to
      validate a number of important results in mathematics.  For
      example, its ability to include complex computations inside
      proofs made it possible to develop the first formally verified
      proof of the 4-color theorem.  This proof had previously been
      controversial among mathematicians because part of it included
      checking a large number of configurations using a program. In
      the Coq formalization, everything is checked, including the
      correctness of the computational part.  More recently, an even
      more massive effort led to a Coq formalization of the
      Feit-Thompson Theorem -- the first major step in the
      classification of finite simple groups. 

   By the way, in case you're wondering about the name, here's what
   the official Coq web site says: "Some French computer scientists
   have a tradition of naming their software as animal species: Caml,
   Elan, Foc or Phox are examples of this tacit convention. In French,
   “coq” means rooster, and it sounds like the initials of the
   Calculus of Constructions CoC on which it is based."  The rooster
   is also the national symbol of France, and "Coq" are the first
   three letters of the name of Thierry Coquand, one of Coq's early
   developers. *)

(* ** Functional Programming *)
(** ** 関数型プログラミング *)

(** The term _functional programming_ refers both to a collection of
    programming idioms that can be used in almost any programming
    language and to a particular family of programming languages that are
    designed to emphasize these idioms, including Haskell, OCaml,
    Standard ML, F##, Scala, Scheme, Racket, Common Lisp, Clojure,
    Erlang, and Coq.  

    Functional programming has been developed by researchers over many
    decades -- indeed, its roots go back to Church's lambda-calculus,
    developed in the 1930s before the era of the computer began!  But
    in the past two decades it has enjoyed a surge of interest among
    industrial engineers and language designers, playing a key role in
    high-value systems at companies like Jane St. Capital, Microsoft,
    Facebook, and Ericsson.

    The most basic tenet of functional programming is that, as much as
    possible, computation should be _pure_: the only effect of running
    a computation should be to produce a result; the computation
    should be free from _side effects_ such as I/O, assignments to
    mutable variables, or redirecting pointers.  For example, whereas
    an _imperative_ sorting function might take a list of numbers and
    rearrange the pointers to put the list in order, a pure sorting
    function would take the original list and return a _new_ list
    containing the same numbers in sorted order.

    One significant benefit of this style of programming is that it
    makes programs easier to understand and reason about.  If every
    operation on a data structure yields a new data structure, leaving
    the old one intact, then there is no need to worry about where
    else in the program the structure is being shared, whether a
    change by one part of the program might break an invariant that
    another part of the program thinks is being enforced.  These
    considerations are particularly critical in concurrent programs,
    where any mutable state that is shared between threads is a
    potential source of pernicious bugs.  Indeed, a large part of the
    recent interest in functional programming in industry is due to its
    simple behavior in the presence of concurrency.

    Another reason for the current excitement about functional
    programming is related to this one: functional programs are often
    much easier to parallelize than their imperative counterparts.  If
    running a computation has no effect other than producing a result,
    then it can be run anywhere.  If a data structure is never
    modified in place, it can be copied freely, across cores or across
    the network.  Indeed, the MapReduce idiom that lies at the heart
    of massively distributed query processors like Hadoop and is used
    at Google to index the entire web is an instance of functional
    programming.

    For purposes of this course, functional programming has one other
    significant attraction: it serves as a bridge between logic and
    computer science.  Indeed, Coq itself can be seen as a combination
    of a small but extremely expressive functional programming
    language, together with a set of tools for stating and proving
    logical assertions.  However, when we come to look more closely,
    we will find that these two sides of Coq are actually aspects of
    the very same underlying machinery -- i.e., _proofs are programs_. *)

(* ** Program Verification *)
(** ** プログラムの検証 *)

(** The first third of the book is devoted to developing the
    conceptual framework of logic and functional programming and to
    gaining enough fluency with the essentials of Coq to use it for
    modeling and reasoning about nontrivial artifacts.  From this
    point on, we will increasingly turn our attention to two broad
    topics of critical importance to the enterprise of building
    reliable software (and hardware!): techniques for proving specific
    properties of particular _programs_ and for proving general
    properties of whole programming _languages_.  

    For both of these, the first thing we need is a way of
    representing programs as mathematical objects (so we can talk
    about them precisely) and of describing their behavior in terms of
    mathematical functions or relations.  Our tools for these tasks
    will be _abstract syntax_ and _operational semantics_, a method of
    specifying the behavior of programs by writing abstract
    interpreters.  At the beginning, we will work with operational
    semantics in the so-called "big-step" style, which leads to
    somewhat simpler and more readable definitions, in those cases
    where it is applicable.  Later on, we will switch to a more
    detailed "small-step" style, which helps make some useful
    distinctions between different sorts of "nonterminating" program
    behaviors and which can be applied to a broader range of language
    features, including concurrency.

    The first programming language we consider in detail is Imp, a
    tiny toy language capturing the most fundamental features of
    conventional imperative languages: variables, assignment,
    conditionals, and loops. We study two different ways of reasoning
    about the properties of Imp programs.  

    First, we consider what it means to say that two Imp programs are
    _equivalent_ in the sense that they give the same behaviors for
    all initial memories.  This notion of equivalence then becomes a
    criterion for judging the correctness of _metaprograms_ --
    programs that manipulate other programs, such as compilers and
    optimizers.  We build a simple optimizer for Imp and prove that it
    is correct.

    Second, we develop a methodology for proving that Imp programs
    satisfy some formal specification of their behavior.  We introduce
    the notion of _Hoare triples_ -- Imp programs annotated with pre-
    and post-conditions describing what should be true about the
    memory in which they are started and what they promise to make
    true about the memory in which they terminate -- and the reasoning
    principles of _Hoare Logic_, a "domain-specific logic" specialized
    for convenient compositional reasoning about imperative programs,
    with concepts like "loop invariant" built in.

    This part of the course will give you a taste of the key ideas and
    mathematical tools used for a wide variety of real-world software
    and hardware verification tasks.

*)

(* ** Type Systems *)
(** ** 型システム *)

(** Our final major topic, covering the last third of the course, is
    _type systems_, a powerful set of tools for establishing
    properties of _all_ programs in a given language.

    Type systems are the best established and most popular example of
    a highly successful class of formal verification techniques known
    as _lightweight formal methods_.  These are reasoning techniques
    of modest power -- modest enough that automatic checkers can be
    built into compilers, linkers, or program analyzers and thus be
    applied even by programmers unfamiliar with the underlying
    theories.  (Other examples of lightweight formal methods include
    hardware and software model checkers and run-time property
    monitoring, a collection of techniques that allow a system to
    detect, dynamically, when one of its components is not behaving
    according to specification).

    In a sense, this topic brings us full circle: the language whose
    properties we study in this part, called the _simply typed
    lambda-calculus_, is essentially a simplified model of the core of
    Coq itself!

*)

(* ###################################################################### *)
(* * Practicalities *)
(** * 実用性 *)

(* ###################################################################### *)
(* ** System Requirements *)
(** ** 学習に必要なもの *)

(** Coq runs on Windows, Linux, and OS X.  You will need:

       - A current installation of Coq, available from the Coq home
         page.  Everything should work with version 8.4.

       - An IDE for interacting with Coq.  Currently, there are two
         choices:

           - Proof General is an Emacs-based IDE.  It tends to be
             preferred by users who are already comfortable with
             Emacs.  It requires a separate installation (google
             "Proof General").

           - CoqIDE is a simpler stand-alone IDE.  It is distributed
             with Coq, but on some platforms compiling it involves
             installing additional packages for GUI libraries and
             such. *)
(** Coqは、Windowsと多くのUNIX系OS（LinuxやMacOS Xを含む）で動きます。具体的には
       - Coqホームページにある最新版のCoq。（全てのサンプルソースはバージョン8.4でコンパイルできることが確認されています）
       - Coqを対話的に操作するIDE。現在、以下の二つから選択できます。
           - ProofGeneralは、Emacs上に作られたIDEです。すでにEmacsに慣れている人向けのものです。Coqとは別にインストールする必要があります。（詳しくはgoogleで"ProofGeneral"を検索してください）
           - CoqIDEは、スタンドアロンで動作するシンプルなIDEです。Coqと一緒に配布されています。しかしいくつかのプラットホームではGUIライブラリなどの追加パッケージをインストールする必要があります。 *)

(* ###################################################################### *)
(* ** Exercises *)
(** ** 練習問題について *)

(* Each chapter includes numerous exercises.  Each is marked with a
    "star rating," which can be interpreted as follows:

       - One star: easy exercises that underscore points in the text
         and that, for most readers, should take only a minute or two.
         Get in the habit of working these as you reach them.

       - Two stars: straightforward exercises (five or ten minutes).

       - Three stars: exercises requiring a bit of thought (ten
         minutes to half an hour).

       - Four and five stars: more difficult exercises (half an hour
         and up).

    Also, some exercises are marked "advanced", and some are marked
    "optional."  Doing just the non-optional, non-advanced exercises
    should provide good coverage of the core material.  "Advanced"
    exercises are for readers who want an extra challenge (and, in
    return, a deeper contact with the material).  "Optional" exercises
    provide a bit of extra practice with key concepts and introduce
    secondary themes that may be of interest to some readers. *)
(** 各章には、たくさんの練習問題がついています。練習問題についている星印の数には、以下のような意味があります。

        - ★　テキストのポイントを強調する簡単な問題で、たいていの読者は1〜2分でできる。遭遇したら取り組むことを習慣にしましょう。
 
       - ★★　素直で簡単な問題（5〜10分でできるでしょう）

       - ★★★　少し考えないといけない問題（15〜30分ほどかかるでしょう）

       - ★★★★　さらに難しい問題（1〜2時間）

「発展(advanced)」「任意(optional)」と記されている問題があります。
章の主要な題材はいずれの印もない問題だけで充分カバーできます。
"発展"問題はさらに挑戦したい（そしてその見返りとしての題材の深い理解を得たい）読者のためのものです。"任意"問題は主な概念に関する少し追加の練習を提供し、読者によっては興味をもつ副次的な話題を紹介しています。 *)

(* ###################################################################### *)
(* ** Chapter Dependencies *)
(** ** 章間の依存関係 *)

(*  A diagram of the dependencies between chapters and some suggested
    paths through the material can be found in the file [deps.html]. *)
(** 章と章の間の依存関係と推奨する学習順序をまとめた図を[deps_J.html]にまとめてあります。 *)

(* ###################################################################### *)
(* ** Downloading the Coq Files *)
(** ** 本教材Coqファイルの入手方法 *)

(*  A tar file containing the full sources for the "release version"
    of these notes (as a collection of Coq scripts and HTML files) is
    available here:
<<
        http://www.cis.upenn.edu/~bcpierce/sf   
>>
    If you are using the notes as part of a class, you may be given
    access to a locally extended version of the files, which you
    should use instead of the release version.
*)
(** この教材のリリース版のソース（CoqスクリプトとHTMLファイル）をtarで固めたものが、以下のURLで取得できます。
<<
        http://www.cis.upenn.edu/~bcpierce/sf
>>
    この資料を講義で利用している場合は、リリース版ではなくローカルに展開された版にアクセスする権限が与えられているかもしれません。
*)

(* ###################################################################### *)
(*  * Note for Instructors *)
(** * 教育関係者へ *)

(*  If you intend to use these materials in your own course, you will
    undoubtedly find things you'd like to change, improve, or add.
    Your contributions are welcome!

    Please send an email to Benjamin Pierce, and we'll set you up with
    read/write access to our subversion repository and developers'
    mailing list; in the repository you'll find a [README] with further
    instructions. *)
(** この資料を自分の講義で使おうと思った場合、ほぼまちがいなくあなたは書き直したり、追加したりしたいところが出てくるでしょう。そういった貢献は大歓迎です。

ぜひBenjamin Pierceまでemailをください。subversionのリポジトリと開発者メーリングリストにアカウントを用意します。リポジトリにはREADMEファイルがありますので、次にどうすべきかはそれを参照してください。 *)

(* ###################################################################### *)
(** * Translations *)

(** Thanks to the efforts of a team of volunteer translators, _Software 
    Foundations_ can now be enjoyed in Japanese:

      - http://proofcafe.org/sf
*)

(* $Date: 2014-06-05 07:22:21 -0400 (Thu, 05 Jun 2014) $ *)

