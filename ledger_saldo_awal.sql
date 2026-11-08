-- Saldo awal ledger: aman dijalankan berulang (hanya mengisi jika belum pernah diisi)
INSERT INTO saldo_mutasi (user_id, type, amount, balance_after, source, note, created_at)
SELECT user_id, 'credit', total_saldo, total_saldo, 'saldo_awal', 'Saldo awal sebelum ledger', NOW()
FROM saldo
WHERE total_saldo > 0 AND user_id IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM saldo_mutasi WHERE source = 'saldo_awal' LIMIT 1);
