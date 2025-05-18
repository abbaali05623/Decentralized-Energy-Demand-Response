;; consumer-registration.clar
;; Records energy users participating in the demand response program

;; Error codes
(define-constant err-unauthorized (err u100))
(define-constant err-already-registered (err u101))
(define-constant err-not-registered (err u102))

;; Import utility verification contract to check for authorized utilities
(use-trait utility-trait .utility-verification.is-verified-utility)

;; Consumer data structure
(define-map consumers
  principal
  {
    utility: principal,
    capacity: uint,
    active: bool
  })

;; Register a new consumer
(define-public (register-consumer
                (utility-trait <utility-trait>)
                (utility principal)
                (capacity uint))
  (let ((verified (contract-call? utility-trait is-verified-utility utility)))
    (begin
      (asserts! verified err-unauthorized)
      (asserts! (is-none (map-get? consumers tx-sender)) err-already-registered)
      (ok (map-set consumers
                tx-sender
                {
                  utility: utility,
                  capacity: capacity,
                  active: true
                })))))

;; Update consumer capacity
(define-public (update-capacity (capacity uint))
  (let ((consumer-data (unwrap! (map-get? consumers tx-sender) err-not-registered)))
    (ok (map-set consumers
              tx-sender
              (merge consumer-data { capacity: capacity })))))

;; Deactivate consumer
(define-public (deactivate-consumer)
  (let ((consumer-data (unwrap! (map-get? consumers tx-sender) err-not-registered)))
    (ok (map-set consumers
              tx-sender
              (merge consumer-data { active: false })))))

;; Reactivate consumer
(define-public (reactivate-consumer)
  (let ((consumer-data (unwrap! (map-get? consumers tx-sender) err-not-registered)))
    (ok (map-set consumers
              tx-sender
              (merge consumer-data { active: true })))))

;; Get consumer data
(define-read-only (get-consumer (address principal))
  (map-get? consumers address))

;; Check if consumer is active
(define-read-only (is-active-consumer (address principal))
  (default-to false
    (get active (default-to
                  { utility: tx-sender, capacity: u0, active: false }
                  (map-get? consumers address)))))
