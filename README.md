# Cloud Computing Simplified
## Summarisations of the As | Active Learning Challenge
### Introduction

Welcome to the **Active Learning Challenge** for the letter **A** of the [Cloud Glossary for Beginners](https://ntombizakhona.medium.com/list/cloud-glossary-for-beginners-528956a3c181).

You've read the theory. You've followed the practicals. Now it's time to *apply* what you've learned. Because reading blog posts, watching tutorials, and attending webinars are valuable first steps, but they won't help you master the cloud on their own. That's where **Active Learning** comes in.

In this challenge you'll build, secure, and monitor one small project, and in doing so you'll bring together **every concept from A to A** in the glossary so far.

> Don't just study cloud computing. **Build with it. Break things (safely). Fix them. Learn. Repeat.**

---

### What is Active Learning?

Active learning is an approach where you engage directly with what you're learning. Instead of absorbing information passively, you *do* something with it. In the cloud, that means launching resources yourself, testing configurations, and solving real problems, like putting a website online or creating an alarm to watch your spending.

When you practice like this, you go beyond theory. You discover how cloud services behave in real life, with all their quirks, limitations, and powerful features.

---

### What You'll Build

A small but complete cloud project, the classic beginner starting point:

1. A **static website** (plain HTML and CSS) hosted on **Amazon S3**.
2. **Access control** done right: the Builder starts with **zero permissions** and earns each one through least-privilege **IAM** policies, plus **MFA**.
3. A **billing alarm** that emails you (an **alert**) before you ever spend money.
4. **Automation** so you can deploy and tear it all down in one step.
5. An **architecture diagram** so you can see how the pieces fit together.

```
You (browser)  -->  S3 Static Website  -->  CloudWatch Alarm  -->  Email Alert
                          ^
                          |
                  IAM controls who can change it
```

---

### What You Need to Get Started

1. Yourself
2. A laptop
3. An internet connection
4. An [AWS Administrative Account](https://medium.com/authentication-fb0d207899a1)
5. A willingness to build, break, and learn

---

### How to Use This Challenge


> 🛠️ **Build from scratch:** There's nothing to clone. You create the project folder and every file in it with your own hands as you go. That's the active-learning part. The layout below is what your repo will look like when you're **done**. 

> 📁 **Where to run commands:** Run every command **from the repo root** (the folder that contains this `README.md`). All command paths in the guide — like `file://infrastructure/iam/...` — are written relative to that root. So `cd` into the project folder once, and stay there.

---

### The Repo You'll Build

```
.
├── README.md
├── website/               # The static site you will deploy
├── infrastructure/
│   ├── cloudformation/    # Infrastructure as Code (Automation)
│   ├── iam/               # Access Control policy examples
│   └── scripts/           # One-step deploy & cleanup
└── diagrams/              # Architecture diagram (Mermaid)
```

---

### ⚠️ Safety First 💸

This challenge uses the **AWS Free Tier**, and everything can be torn down. Still, always:

- Set up the **billing alarm** early.
- Run the **cleanup** when you finish.
- Never commit AWS keys to git (the included [.gitignore](.gitignore) already blocks them).

---

### Contributing

If you'd like to contribute, please open a pull request or issue. I welcome any suggestions, corrections, or additions. I'll apply these modifications across the relevant platforms.

---

## Cloud Computing Simplified: A Cloud Glossary For Beginners

**Blog:** [Ntombizakhona Mabaso](https://medium.com/@ntombizakhona)
<br>
**The Cloud Glossary:** [Cloud Glossary for Beginners](https://ntombizakhona.medium.com/list/cloud-glossary-for-beginners-528956a3c181)
<br>
Ntombizakhona Mabaso — *Cloud Engineer*

Licensed under [MIT](LICENSE).
