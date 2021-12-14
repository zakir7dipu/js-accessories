const downloadInvoice = () => {
  const element = document.getElementById('page-wrap');
  html2pdf().from(element).save();
};
